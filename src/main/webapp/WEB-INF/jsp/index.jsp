<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

 <!-- 内容主体区域 -->
        <div style="padding: 15px;">
              <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                  <li class="layui-this">收件箱</li>
                  <li>未读邮件</li>
                  <li>重要邮件</li>
                 
                </ul>
                <div class="layui-tab-content">
                  <div class="layui-tab-item layui-show">
                    <table class="layui-table" lay-size="sm">
                        <colgroup>
                            <col>
                            <col width="100">
                            <col width="300">
                        </colgroup>
                        <thead>
                          <tr>
                            <th>标题</th>
                            <th>收件人</th>
                            <th>发送时间</th>
                          </tr> 
                        </thead>
                        <tbody>
                          <tr>
                            <td>人生就像是一场修行</td>
                            <td>贤心</td>
                            <td>2016-11-29</td>
                          </tr>
                          <tr>
                            <td>于千万人之中遇见你所遇见的人</td>
                            <td>许闲</td>
                            <td>2016-11-28</td>
                          </tr>
                         
                        </tbody>
                      </table>
                  </div>
                  <div class="layui-tab-item">2</div>
                  <div class="layui-tab-item">3</div>
                  <div class="layui-tab-item">4</div>
                 
                </div>
              </div>

              <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                  <div class="layui-col-md6">
                    <div class="layui-card">
                     
                      <div class="layui-card-body">
                        <div class="layui-tab layui-tab-card">
                            <ul class="layui-tab-title">
                              <li class="layui-this">公告</li>
                              <li>所属部门公告</li>
                             
                             
                            </ul>
                            <div class="layui-tab-content">
                              <div class="layui-tab-item layui-show">
                                <table class="layui-table" lay-size="sm">
                                    <colgroup>
                                        
                                        <col width="100">
                                        <col width="100">
                                    </colgroup>
                                    <thead>
                                      <tr>
                                        <th>主题</th>
                                        <th>发布时间</th>
                                     
                                      </tr> 
                                    </thead>
                                    <tbody>
                                      <tr>
                                       
                                        <td>贤心</td>
                                        <td>2016-11-29</td>
                                      </tr>
                                      <tr>
                                      
                                        <td>许闲</td>
                                        <td>2016-11-28</td>
                                      </tr>
                                     
                                    </tbody>
                                  </table>
                              </div>
                              <div class="layui-tab-item">2</div>
                              <div class="layui-tab-item">3</div>
                              <div class="layui-tab-item">4</div>
                             
                            </div>
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="layui-col-md6">
                    <div class="layui-card">
                     
                      <div class="layui-card-body">
                        <div class="layui-tab layui-tab-card">
                            <ul class="layui-tab-title">
                              <li class="layui-this">会议</li>
                              <li>今天日程</li>
                              <li>个人日程</li>
                             
                            </ul>
                            <div class="layui-tab-content">
                              <div class="layui-tab-item layui-show">
                                <table class="layui-table" lay-size="sm">
                                    <colgroup>
                                        <col>
                                        <col width="80">
                                        <col width="80">
                                    </colgroup>
                                    <thead>
                                      <tr>
                                        <th>标题</th>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                      </tr> 
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <td>人生就像是一场修行</td>
                                        <td>2016-11-29</td>
                                        <td>2016-11-29</td>
                                      </tr>
                                      <tr>
                                        <td>于千万人之中遇见你所遇见的人</td>
                                        <td>2016-11-29</td>
                                        <td>2016-11-28</td>
                                      </tr>
                                     
                                    </tbody>
                                  </table>
                              </div>
                              <div class="layui-tab-item">2</div>
                              <div class="layui-tab-item">3</div>
                              <div class="layui-tab-item">4</div>
                             
                            </div>
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="layui-col-md12">
                    <div class="layui-card">
                      <div class="layui-card-header">标题</div>
                      <div class="layui-card-body">
                        内容
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              
        </div>