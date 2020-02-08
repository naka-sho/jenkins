## jenkins

### イメージ作成
```
docker build ./ -t my-jenkins
```

### サービス起動
```
docker run --privileged -i -d -p 80:8080 --name jenkins my-jenkins /sbin/init
docker exec -it jenkins /bin/bash
systemctl start jenkins
```

### 初回パスワード取得
```
docker exec -it jenkins bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```

### イメージの削除
```
docker rmi my-jenkins
```
