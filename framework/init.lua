cc = cc or {}

local CURRENT_MODULE_NAME = ...
cc.PACKAGE_NAME = string.sub(CURRENT_MODULE_NAME, 1, -6)

require(cc.PACKAGE_NAME .. ".debug")
require(cc.PACKAGE_NAME .. ".functions")
