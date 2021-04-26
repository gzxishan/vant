@echo off
set currentPath=%cd%
set pkgsPath=%currentPath%\packages
echo pkgsPath:%pkgsPath%

set moduleName=create-vant-cli-app
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-cli
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-eslint-config
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-icons
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-markdown-loader
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-markdown-vetur
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-popperjs
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-stylelint-config
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-touch-emulator
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

set moduleName=vant-waterfall
echo install: %pkgsPath%\%moduleName%
cd %pkgsPath%\%moduleName% && call cnpm install

cd %currentPath%
