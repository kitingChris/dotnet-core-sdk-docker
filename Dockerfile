ARG BASE_TAG=2.2-alpine3.9
FROM mcr.microsoft.com/dotnet/core/sdk:${BASE_TAG}
WORKDIR /app
RUN apk add --update --no-cache --virtual .build-deps curl bash; \
    wget https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh; \
    chmod +x installcredprovider.sh; \
    ./installcredprovider.sh; \
    rm installcredprovider.sh; \
    apk del .build-deps;
