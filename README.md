james@Red:~/DocumentIndexing/AlpineNodeAngularBuildImage$ docker run -it -e LOCAL_USER_ID=`id -u $USER` 565 sh 
Starting with UID : 1000
/ $ ^C
A
A
A
james@Red:~/DocumentIndexing/AlpineNodeAngularBuildImage$ docker run -it -v `pwd`/src/main/angular:/angular^Clpine/node 
