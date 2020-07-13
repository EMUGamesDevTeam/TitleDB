/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
const path=require("path");delete process.env.ELECTRON_RUN_AS_NODE,process.env.VSCODE_INJECT_NODE_MODULE_LOOKUP_PATH=process.env.VSCODE_INJECT_NODE_MODULE_LOOKUP_PATH||path.join(__dirname,"..","..","..","remote","node_modules"),require("../../bootstrap").injectNodeModuleLookupPath(process.env.VSCODE_INJECT_NODE_MODULE_LOOKUP_PATH),require("../../bootstrap-amd").load("vs/server/remoteCli");
//# sourceMappingURL=https://ticino.blob.core.windows.net/sourcemaps/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/core/vs/server/cli.js.map
