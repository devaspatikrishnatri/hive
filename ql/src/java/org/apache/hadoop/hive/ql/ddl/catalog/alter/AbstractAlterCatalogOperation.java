/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.hadoop.hive.ql.ddl.catalog.alter;

import org.apache.hadoop.hive.metastore.api.Catalog;
import org.apache.hadoop.hive.ql.ErrorMsg;
import org.apache.hadoop.hive.ql.ddl.DDLOperation;
import org.apache.hadoop.hive.ql.ddl.DDLOperationContext;
import org.apache.hadoop.hive.ql.metadata.HiveException;

/**
 * Operation process of altering a catalog.
 */
public abstract class AbstractAlterCatalogOperation<T extends AbstractAlterCatalogDesc> extends DDLOperation<T> {
  public AbstractAlterCatalogOperation(DDLOperationContext context, T desc) {
    super(context, desc);
  }

  @Override
  public int execute() throws Exception {
    String catalogName = desc.getCatalogName();
    Catalog catalog = context.getDb().getMSC().getCatalog(catalogName);
    if (catalog == null) {
      throw new HiveException(ErrorMsg.CATALOG_NOT_EXISTS, catalogName);
    }
    doAlteration(catalog);

    context.getDb().alterCatalog(catalogName, catalog);
    return 0;
  }

  protected abstract void doAlteration(Catalog catalog) throws HiveException;
}
