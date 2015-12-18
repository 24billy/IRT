--作答反應--
INSERT INTO response(id,guild,response_content) VALUES (1,'{"answer":["完全無法做到","很多困難","中等困難","一點困難","完全沒有困難"]}','在過去一週裡：');
INSERT INTO response(id,guild,response_content) VALUES (2,'{"answer":["從未如此","很少時間如此","某些時間如此","大部分時間如此","總是如此"]}','在過去一週裡：');
INSERT INTO response(id,guild,response_content) VALUES (3,'{"answer":["從未如此","很少時間如此","某些時間如此","大部分時間如此","總是如此"]}','在過去四星期內,您在從事以下活動而感覺受限的情況有多頻繁…');
INSERT INTO response(id,guild,response_content) VALUES (4,'{"answer":["極不滿意","不滿意","中等程度滿意","滿意","極滿意"]}','我們的問題所關心的是您最近兩星期內的生活情形，請您用自己的標準、希望、愉快、以及關注點來回答問題。請參考下面的例題：');
INSERT INTO response(id,guild,response_content) VALUES (5,'{"answer":["完全沒有","有一點有","中等程度有","很有","極有"]}','我們的問題所關心的是您最近兩星期內的生活情形，請您用自己的標準、希望、愉快、以及關注點來回答問題。請參考下面的例題：');
INSERT INTO response(id,guild,response_content) VALUES (6,'{"answer":["完全沒有機會","少許機會","中等程度機會","很有機會","完全有機會"]}','我們的問題所關心的是您最近兩星期內的生活情形，請您用自己的標準、希望、愉快、以及關注點來回答問題。請參考下面的例題：');
INSERT INTO response(id,guild,response_content) VALUES (7,'{"answer":["從來沒有","很少","偶爾","常常","總是"]}','在過去一星期內‚您出現以下情況有多頻繁…');

--題目--
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(1,'從事以前工作',0.168,0.293,0.049,-0.155,-0.188,1);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(2,'覺得自已是家人的負擔',0.141,-0.599,1.365,-0.522,-0.244,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(3,'身體狀況妨礙家庭生活',0.201,-0.625,1.549,-1.187,0.263,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(4,'出門的次數沒有想要的那麼多',0.368,-0.318,0.805,0.037,-0.524,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(5,'從事嗜好及娛樂時間比想要的時間少',0.353,-0.503,0.867,0.359,-0.723,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(6,'見到的朋友沒有想要的那麼多',0.191,-0.377,0.405,0.078,-0.106,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(7,'性生活沒有想要的那麼多',0.163,-0.364,-0.788,1.638,-0.487,2);
INSERT INTO item(id,item_content,delta,step1,step2,step3,step4,answer_type) VALUES(8,'身體狀況妨礙社交生活',0.297,-0.425,1.099,-0.093,-0.58,2);

--使用者帳密--
INSERT INTO role(id,user_name,user_password) VALUES (1,'Billy','4321');
INSERT INTO role(id,user_name,user_password) VALUES (2,'Allen','1234');

--作答結果--