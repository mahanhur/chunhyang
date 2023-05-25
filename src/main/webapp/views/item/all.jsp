<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

<script>

</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Item ALL</h1>
    </div>
    <%--<script>--%>
    <%--    let item_search = {--%>
    <%--        init: function () {--%>
    <%--            $('#search_btn').click(function () {--%>
    <%--                $('#search_form').attr({--%>
    <%--                    method: 'get',--%>
    <%--                    action: '/item/search'--%>
    <%--                });--%>
    <%--                $('#search_form').submit();--%>
    <%--            });--%>
    <%--        }--%>
    <%--    };--%>
    <%--    $(function () {--%>
    <%--        item_search.init();--%>
    <%--    })--%>
    <%--</script>--%>
    <style>
        .medium_img {
            width: 80px;
            height: 80px;
        }

        .detail_img {
            width: 400px;
            height: 300px;
        }
    </style>
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">ITEM</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">ITEM ALL</h6>
                <form action="/item/search" method="get" id="search_form" class="form-inline well">

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="name" placeholder="Enter title"
                                   value="${ms.name}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">Price:</label>
                        <div class="col-sm-10">
                            <input type="number" name="price" class="form-control" id="price" placeholder="Enter title"
                                   value="${ms.price}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="startdate">Start Date:</label>
                        <div class="col-sm-10">
                            <input type="date" name="startdate" class="form-control" id="startdate"
                                   placeholder="Enter title"
                                   value="${ms.startdate}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="enddate">End Date:</label>
                        <div class="col-sm-10">
                            <input type="date" name="enddate" class="form-control" id="enddate" placeholder="Enter title"
                                   value="${ms.enddate}"
                            >
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-2">
                            <button id="search_btn" type="submit" class="btn btn-info">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>IMG</th>
                            <th>CATEGORY</th>
                            <th>NAME</th>
                            <th>PRICE</th>
                            <th>CNT</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>IMG</th>
                            <th>CATEGORY</th>
                            <th>NAME</th>
                            <th>PRICE</th>
                            <th>CNT</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach var="obj" items="${flist}">
                            <tr>
                                <td>${obj.item_img1}</td>
                                <td>${obj.category_id}</td>
                                <td>${obj.item_name}</td>
                                <td><fmt:formatNumber value="${obj.item_price}" type="currency"/></td>
                                <td>${obj.item_cnt}</td>
                            </tr>
                        </c:forEach>

<%--                            <!-- Modal -->--%>
<%--                            <div id="target${obj.id}" class="modal fade" role="dialog">--%>
<%--                                <div class="modal-dialog">--%>

<%--                                    <!-- Modal content-->--%>
<%--                                    <div class="modal-content">--%>
<%--                                        <div class="modal-header">--%>
<%--                                            <h4 class="modal-title">Detail Image</h4>--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-body">--%>
<%--                                            <p>${obj.name}</p>--%>
<%--                                            <img src="/uimg/${obj.imgname}" class="detail_img">--%>
<%--                                        </div>--%>
<%--                                        <div class="modal-footer">--%>
<%--                                            <a href="/item/detail?id=${obj.id}" class="btn btn-primary"--%>
<%--                                               role="button">Detail</a>--%>
<%--                                            <a href="#" class="btn btn-default" role="button" data-dismiss="modal">Close</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</main>