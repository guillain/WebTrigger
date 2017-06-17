/*
 @ Target: MySQL init data
 @ Version: 0.1
 @ Date: 2017/02/04
 @ Author: Guillain (guillain@gmail.com)
 @ Copyright 2017 GPL - Guillain
*/

INSERT INTO users (uid, login, email, webhook, mobile, pw_hash, accesstoken) VALUES
  ('1', 'admin','admin@mail.com','http://myserver.com/webhook/admin','+33654321012',PASSWORD('admin'),''),
  ('2', 'user' ,'user@mail.com','http://myserver.com/webhook/user','+33654321012',PASSWORD('user'),''),
  ('3', 'guest','guest@mail.com','http://myserver.com/webhook/guest','+33654321012',PASSWORD('guest'),'');

INSERT INTO groups (gid, name, description, creationdate) VALUES
  ('1', 'admin','Admin group',NOW()),
  ('2', 'user' ,'User group',NOW()),
  ('3', 'guest','Guest group',NOW());

INSERT INTO mapping (uid, gid, admin, moder) VALUES
  ('1','1','1','1'),
  ('2','2','1','0'),
  ('3','3','0','0');


