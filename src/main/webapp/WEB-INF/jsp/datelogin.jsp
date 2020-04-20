<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- 内容主体区域 -->
<!DOCTYPE html>
    <html>
      <head>
        <title>日程表</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">    
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">

    <script src="static/fullcalendar/lib/jquery.min.js"></script>
    <script src="static/fullcalendar/lib/jquery-ui.min.js"></script>
    <link href="static/fullcalendar/css/fullcalendar.min.css" rel="stylesheet" />
    <script src="static/fullcalendar/lib/moment.min.js"></script>
    <script src="static/fullcalendar/fullcalendar.min.js"></script>
    <script src="static/fullcalendar/locale-all.js"></script>
      </head>
    <script>
        $(document).ready(function() {           
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay,listMonth'
                },
                editable: true,
                eventLimit: true,
                navLinks: true,
                locale: 'zh-cn',
                weekMode: 'liquid',
                buttonIcons: false,
                businessHours: true,
                events: function(start, end, timezone, callback){
                	var date = this.getDate().format('YYYY-MM'); 
                	//var date = new Date();               	 
                    $.ajax({                                              
                        url : 'dates',
                        dataType: 'json',
                        data:{"data":date,},
                           success: function(json) {// 获取当前月的数据
                        	   var events = [];                                                      	   
                               	   events.push({
                                          title: json.title,
                                          start: json.date , // will be parsed
                                          color: '#BEEABE'
                                      });

                               callback(events);                               
                 /*        success : function(data) {
                            callback(data);
                        } */
                           }     
                    });
                    
                },
                //当单击日历中的某一天时，触发callback
                dayClick: function(date, allDay, jsEvent, view) {
                	var datas=$.fullCalendar.formatDate(date, "YYYY-MM-DD");   
                    var title=$("#title").val();
                    $("#oneday").show();                             
                    alert("现在的时间为:"+datas+":"+title);
                    alert($.fullCalendar.formatDate(date, "YYYY-MM-DD"));
                    
                },
                //当点击日历中的某一日程（事件）时，触发此操作
                eventClick: function(event) {
                    alert("shij");
                    alert(event.title);
                }
                
            });
            
        });
     
    </script>
    <style>
        body {
            margin: -6px 10px;
            
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            /* ont-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; */
            font-size: 14px;
            /* ont-size: 14px; */
        }
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>  
      <body>
        <div id='calendar'></div>  
        <div id="oneday" style="display: none;">  
        <table>  
        <tr> 
        <td> <input type="text" name="title" id="title"  value="12"/>  </td>
        </tr> 
         </table>  </div>  
      </body>
</html>