# LoggingProject
Testing Spring, ELK stack and docker configuration.

## Enter Docker Container

> docker exec -ti ONE /bin/sh

## Logs in Docker Container

> docker logs -f ContainerName

## Physical Logs

Add to `application.properties`:
```
logging.file.path=log
```

Print physical logs:
> cat workspace/log/spring.log

## ELK stack

- Elasticsearch is a search and analytics engine:
- Logstash is a tool for managing logs.
- Kibana is a web application for visualizing and analyzing Elasticsearch data.

Some interesting qualities of this stack:
- RESTful
- Distributed
- Scalable
- Open Source
- Cloud-Native