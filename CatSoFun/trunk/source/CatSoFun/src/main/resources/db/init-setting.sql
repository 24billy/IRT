--作答反應--
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (1,'完全無法做到','很多困難','中等困難','一點困難','完全沒有困難','在過去一週裡：');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (2,'非常同意','中等同意','不同意也不反對','中等不同意','非常不同意','在過去一週裡：');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (3,'總是如此','大部分時間如此','某些時間如此','很少時間如此','從未如此','在過去四週內,您在從事以下活動而感覺受限的頻率為…');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (4,'極不滿意','不滿意','中等程度滿意','滿意','極滿意','在過去二週裡：');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (5,'完全沒有','有一點有','中等程度有','很有','極有','在過去二週裡：');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (6,'完全沒有機會','少許機會','中等程度機會','很有機會','完全有機會','在過去二週裡：');
INSERT INTO response(id,option_01,option_02,option_03,option_04,option_05,guild) VALUES (7,'總是','常常','偶爾','很少','從來沒有','在過去一週內‚您出現以下情況有多頻繁…');

--題目--
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(1,'從事以前工作',0.168,0.293,0.049,-0.155,-0.188,1);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(2,'覺得自已是家人的負擔',0.141,-0.599,1.365,-0.522,-0.244,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(3,'我的身體狀況妨礙家庭生活',0.201,-0.625,1.549,-1.187,0.263,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(4,'出門的次數沒有想要的那麼多',0.368,-0.318,0.805,0.037,-0.524,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(5,'從事嗜好及娛樂時間比想要的時間少',0.353,-0.503,0.867,0.359,-0.723,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(6,'見到的朋友沒有想要的那麼多',0.191,-0.377,0.405,0.078,-0.106,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(7,'性生活沒有想要的那麼多',0.163,-0.364,-0.788,1.638,-0.487,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(8,'身體狀況妨礙社交生活',0.297,-0.425,1.099,-0.093,-0.58,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(9,'您的工作(不論是有給職ヽ義工ヽ或其它工作)?',0.22,0.48,0.177,-0.211,-0.446,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(10,'您的社交活動?',-0.05,-0.41,0.431,0.518,-0.539,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(11,'靜態休閒活動(如手工藝品製作ヽ閱讀)?',-0.69,0.236,-0.004,0.178,-0.41,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(12,'動態休閒活動(如運動ヽ遠足ヽ旅遊)?',0.25,-0.082,0.365,0.678,-0.96,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(13,'您扮演一位家庭成員或朋友的角色?',-0.39,0.52,-0.258,0.084,-0.346,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(14,'您參與靈性或宗教性活動?',-0.30,0.917,-0.458,0.207,-0.666,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(15,'您幫助他人的能力?',-0.14,0.061,-0.097,0.419,-0.383,3);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(16,'工作能力滿意度',0.40,-1.538,-0.596,0.334,1.799,4);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(17,'人際關係滿意度',-0.06,-2.045,-0.883,0.492,2.436,4);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(18,'性生活滿意度',0.21,-2.362,-1.084,0.976,2.47,4);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(19,'朋友支持滿意度',-0.31,-2.194,-0.553,-0.047,2.794,4);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(20,'有面子或被尊重',0.22,-0.977,-1.436,0.281,2.132,5);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(21,'有機會從事休閒活動',0.63,-0.919,-0.577,0.069,1.427,6);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(22,'對別人感到退縮',-0.43,-0.581,1.393,-0.662,-0.149,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(23,'感覺沒有親近的人?',-1.18,-0.686,-0.351,0.938,0.099,7);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(24,'感覺您是別人的負擔?',-0.26,-0.363,-0.602,0.969,-0.004,7);

--使用者帳密--
INSERT INTO role(id,user_name,user_password,role_type) VALUES (1,'Billy','4321','system');
INSERT INTO role(id,user_name,user_password,role_type) VALUES (2,'Allen','1234','system');
INSERT INTO role(id,user_name,user_password,role_type) VALUES (3,'admin','admin','system');

--作答結果--