#!/bin/bash
set -e
echo "···································································································"
echo "MARTIN FABRIZZIO VILCHE - https://github.com/mvilche"
echo "···································································································"


export LIBGL_ALWAYS_SOFTWARE=1 glxgears
export LIBGL_DRI3_DISABLE=1
export XDG_RUNTIME_DIR=/tmp/qgis_runtime
export APP_NAME=qgis

if [ -z "$USER_ID" ]; then
echo "···································································································"
echo "DEBE DEFINIR LA VARIABLE USER_ID"
echo "···································································································"
exit 1
else
echo "···································································································"
echo "INICIANDO $APP_NAME CON USER_ID: $USER_ID"
echo "···································································································"
echo "···································································································"
echo "RECUERDE GUARDAR TODOS SUS TRABAJOS EN QGIS EN EL DIRECTORIO PERSISTENTE '/home/qgis/proyectos' "
echo "···································································································"
usermod -u $USER_ID qgis &> /dev/null && groupmod -g $USER_ID qgis &> /dev/null
chown -R $USER_ID:$USER_ID /home/qgis && echo "FIX PERMISOS OK!"
fi


if [ ! -d /tmp/qgis_runtime ]; then
mkdir /tmp/qgis_runtime && chown -R $USER_ID:$USER_ID /tmp/qgis_runtime
fi


echo "INICIANDO $APP_NAME...."
exec gosu $USER_ID "$@"
