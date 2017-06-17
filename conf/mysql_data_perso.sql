/*
 @ Target: MySQL init data
 @ Version: 0.1
 @ Date: 2017/06/17
 @ Author: Guillain (guillain@gmail.com)
 @ Copyright 2017 GPL - Guillain
*/

TRUNCATE users;
INSERT INTO users (uid, login, email, webhook, mobile, pw_hash, accesstoken, creationdate) VALUES
  (1, 'guillain', 'guillain@gmail.com', 'http://164.177.187.20:8080/trigger/pod-Demo', '+33609625172', '*2F47709A8C2E4368CA9547C8E31D41313FB286B5','ZWI2OGVlNzAtZTllNC00MDI1LWFlMmQtN2IwYjIzOTdhOWEyMGY3MmJmZTUtNzkw', NOW()),
  (2, 'guillaindd', 'guillain.sanchez@eu.didata.com', 'http://164.177.187.20:8080/trigger/pod-DD', '+33624802136', '*2F47709A8C2E4368CA9547C8E31D41313FB286B5','MTEzNWVlZDAtZmJhYy00YmYxLWJmMmItYTY3ZDc5NjAzZjNhYTViYmI0MzctYzIw',NOW()),
  (3, 'guillainairbus', 'guillain.sanchez@airbus.com', 'http://164.177.187.20:8080/trigger/pod-AI', '', '*2F47709A8C2E4368CA9547C8E31D41313FB286B5','OWQ5ZmFmMTgtNTYzNS00MGJmLTlkYzUtZjAxMzU3MWEzMDk4YTRlYTExOTctNjUz',NOW()),
  (4,'ShopFloor','shop.floor.stelia@gmail.com','http://164.177.187.20:8080/trigger/pod-Demo','',PASSWORD('ShopFloor'),'',NOW()),
  (5,'StressEngineer','stress.engineer.stelia@gmail.com','http://164.177.187.20:8080/trigger/pod-Demo','',PASSWORD('StressEngineer'),'',NOW()),
  (6,'DesignEngineer','design.engineer.stelia@gmail.com','http://164.177.187.20:8080/trigger/pod-Demo','',PASSWORD('DesignEngineer'),'',NOW());

TRUNCATE groups;
INSERT INTO groups (gid, name, description, creationdate) VALUES
  (1, 'admin','Admin group',NOW()),
  (2, 'user','User group',NOW()),
  (3, 'guest','Guest group',NOW());

TRUNCATE mapping;
INSERT INTO mapping (uid, gid, admin, moder) VALUES
  (1,1,1,1),
  (2,2,1,0),
  (3,3,0,0),
  (4,2,0,0),
  (5,2,1,0),
  (6,2,1,0);

