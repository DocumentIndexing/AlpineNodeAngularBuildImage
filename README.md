# Alpine, Node and Angular 

This is a docker image that contains the Alpine, Node and Angular

james@Red:~/DocumentIndexing/AlpineNodeAngularBuildImage$ docker run -it -e LOCAL_USER_ID=`id -u $USER` 565 sh 
Starting with UID : 1000
/ $ ^C
A
A
A
```
docker run -it \
        -v `pwd`/src/main/angular:/angular  \
        -e LOCAL_USER_ID=`id -u $USER` \
        guidof/angular-build sh
```