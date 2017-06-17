VERSION="1.0.0"
USER='guillain'

#git branch "${VERSION}"
git add \
  ./run \
  ./README.md \
  ./LICENSE \
  ./requirements.txt \
  ./WebTrigger.wsgi \
  ./conf/apache.conf.default \
  ./conf/apache-secure.conf.default \
  ./conf/mysql_data.sql \
  ./conf/mysql.sql \
  ./conf/settings.cfg.default \
  ./WebTrigger/__init__.py \
  ./WebTrigger/static/css/bootstrap.min.css \
  ./WebTrigger/static/css/WebTrigger.css \
  ./WebTrigger/static/image/loading.gif \
  ./WebTrigger/static/image/spark.ico \
  ./WebTrigger/static/image/warning_big.png \
  ./WebTrigger/static/image/warning.png \
  ./WebTrigger/static/__init__.py \
  ./WebTrigger/static/js/WebTrigger.js \
  ./WebTrigger/static/js/jquery-1.9.0.js \
  ./WebTrigger/static/js/jquery.popupoverlay.js \
  ./WebTrigger/static/js/script.js \
  ./WebTrigger/static/js/spark_auth.js \
  ./WebTrigger/static/py/WebTrigger.py \
  ./WebTrigger/static/py/__init__.py \
  ./WebTrigger/static/py/tools.py \
  ./WebTrigger/static/py/mail.py \
  ./WebTrigger/static/py/login.py \
  ./WebTrigger/templates/WebTrigger.html \
  ./WebTrigger/templates/flash.html \
  ./WebTrigger/templates/index.html \
  ./WebTrigger/templates/login.html \
  ./WebTrigger/templates/main.html \
  ./WebTrigger/templates/sparkauth.html

git commit -m "prepare for ${VERSION}"

git push

