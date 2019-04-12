<%--
  Created by IntelliJ IDEA.
  User: GAVIN
  Date: 2018/9/16
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        .not-arrow{

            -webkit-appearance:none;

            -moz-appearance:none;

            appearance:none; /*去掉下拉箭头*/

        }

        /*清除ie的默认选择框样式清除，隐藏下拉箭头*/

        .not-arrow::-ms-expand { display: none; }
    </style>

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- InsertModal -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="insertModalLabel">新增用户</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form class="form-horizontal" id="emps_modal_form">
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="inputEmai2"
                                       placeholder="Confirm Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" name="password" class="form-control" id="inputPassword1" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="inputPassword2"
                                       placeholder="Confirm Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <select name="gender" class="form-control not-arrow" id="select1">
                                    <option>Gender</option>
                                    <option value="M">MALE</option>
                                    <option value="F">FEMALE</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <select name="dId" class="form-control not-arrow" id="select2">
                                    <option>Department</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save">Save</button>
            </div>
        </div>
    </div>
</div>

<!-- updateModal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">新增用户</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="email" class="form-control" id="inputEmai3" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="inputEmai4"
                                       placeholder="Confirm Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="inputPassword4"
                                       placeholder="Confirm Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <select class="form-control not-arrow" id="select3">
                                    <option>Gender</option>
                                    <option>MALE</option>
                                    <option>FEMALE</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5">
                                <select class="form-control not-arrow" id="select4">
                                    <option>Department</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>CRUD</h1>
        </div>
    </div>
    <%--列表名--%>
    <div class="row">
        <div class="col-md-4">
            <h3>SSM-CRUD</h3>
        </div>
        <div class="col-md-4 col-md-offset-4">
                <button class="btn btn-primary" id="addbtn_with_modal">Insert</button>
            <button class="btn btn-danger">Delete</button>
        </div>
    </div>
    <%--table--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>#</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>DepName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>

            </table>
        </div>
    </div>
    <%--分页--%>
    <div class="row">
        <div class="col-md-6 " id="build_page_info"></div>
        <div class="col-md-6 col-md-offset-6" id="build_page_nav"></div>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        href_page(1);
    });

    function href_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1、解析并显示员工数据
                build_emps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {

        $("#emps_table tbody").empty();

        var emps = result.extend.PageInfo.list;

        $.each(emps, function (index, item) {
            var radiio = $("<td></td>").append("<input type=\"checkbox\">");
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = $("<td></td>").append(item.gender == 'M' ? '男' : '女');
            var email = $("<td></td>").append(item.email);
            var department = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-plus")).append(" Update");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-minus")).append(" Delete");
            var btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(radiio)
                .append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(department)
                .append(btn)
                .appendTo("#emps_table tbody");
        })

    }

    function build_page_info(result) {

        $("#build_page_info").empty();

        $("#build_page_info").append("当前第" + result.extend.PageInfo.pageNum + "页,总" + result.extend.PageInfo.pages + "页,总共有" + result.extend.PageInfo.total + "记录")

    }

    function build_page_nav(result) {

        $("#build_page_nav").empty();

        var emps = result.extend.PageInfo;
        var ul = $("<ul></ul>").addClass("pagination");
        var fistPg = $("<li></li>").append($("<a></a>").append("首页"));
        var previousPg = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var navigatePg = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPg = $("<li></li>").append($("<a></a>").append("末页"));
        if (!emps.hasPreviousPage) {
            fistPg.addClass("disabled");
            previousPg.addClass("disabled");
        } else {
            fistPg.click(function () {
                href_page(1);
            });
            previousPg.click(function () {
                href_page(emps.prePage);
            });
        }
        if (!emps.hasNextPage) {
            lastPg.addClass("disabled");
            navigatePg.addClass("disabled");
        } else {
            lastPg.click(function () {
                href_page(emps.pages);
            });
            navigatePg.click(function () {
                href_page(emps.nextPage);
            });
        }
        ul.append(fistPg).append(previousPg);
        $.each(emps.navigatepageNums, function (index, item) {
            var numPg = $("<li></li>").append($("<a></a>").append(item));
            if (emps.pageNum == item) {
                numPg.addClass("active");
            } else {
                numPg.click(function () {
                    href_page(item);
                });
            }
            ul.append(numPg);
        });
        ul.append(navigatePg).append(lastPg);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#build_page_nav");

        $("#addbtn_with_modal").click(function () {
            //发生ajax请求，查找dept信息
            getDept();

            $("#insertModal").modal({
                backdrop: "static"
            })
        });

        $("#emp_save").click(function () {
            saveEmps();
        })
    }

    function getDept() {
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                var depts = result.extend.depts;
                $.each(depts, function (index, item) {
                    var optionEle = $("<option></option>").append(item.deptName).attr("value", item.deptId);
                    optionEle.appendTo("#select2");
                })
            }
        });
    }
    
    function saveEmps() {
        // alert($("#emps_modal_form").serialize());
        $.ajax({
            url: "${APP_PATH}/emps",
            type: "POST",
            data: $("#emps_modal_form").serialize(),
            success: function (result) {
                alert(result.msg);
            },
            error: alert("")
        });
    }

</script>

</body>
</html>
