FROM praekeltfoundation/molo-bootstrap:4.3.2-onbuild

ENV DJANGO_SETTINGS_MODULE=tuneme.settings.docker \
    CELERY_APP=tuneme \
    CELERY_BEAT=1

COPY docker/settings.py /app/tuneme/settings/docker.py

RUN LANGUAGE_CODE=en django-admin compilemessages && \
    django-admin collectstatic --noinput && \
    django-admin compress

CMD ["tuneme.wsgi:application", "--timeout", "1800"]
