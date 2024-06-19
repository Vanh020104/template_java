
<%@page import="java.util.List" %>
<%@page import="com.example.template_admin.entity.Products" %>

<%@include file="/include/head.jsp"%>
<%@include file="/include/header.jsp"%>
<div id="layoutSidenav">
    <%@include file="/include/navbar.jsp"%>
    <div id="layoutSidenav_content">
        <main>
            <div class="container">
                <div class="card">
                    <h2 class="text-center mb-4">Edit Product</h2>
                    <form action="editProduct" method="POST">
                        <div class="form-row mb-3">
                            <div class="form-group">
                                <label class="form-label">ID</label>
                                <input type="number" name="id" value="${product.id}" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label  class="form-label">Name</label>
                                <input type="text" name="name" value="${product.name}" class="form-control">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Image</label>
                            <input type="text" name="image" value="${product.image}" class="form-control">
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Category</label>
                            <input type="text" name="category" value="${product.category}" class="form-control">
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">Description</label>
                            <input type="text" value="${product.description}" name="description" class="form-control" >
                        </div>
                        <div class="form-row mb-3">
                            <div class="form-group">
                                <label class="form-label">Price</label>
                                <input type="number" name="price" value="${product.price}" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label class="form-label">Quantity</label>
                                <input type="number" name="quantity" value="${product.quantity}" class="form-control" >
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%;">Submit</button>
                    </form>
                </div>
            </div>
        </main>

    </div>
</div>

<%@include file="/include/footer.jsp"%>
<script>
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Area Chart Example
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
            datasets: [{
                label: "Sessions",
                lineTension: 0.3,
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 5,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 40000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });

    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June"],
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: [4215, 5312, 6251, 7841, 9821, 14984],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 15000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });
    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Pie Chart Example
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["Blue", "Red", "Yellow", "Green"],
            datasets: [{
                data: [12.21, 15.58, 11.25, 8.32],
                backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
            }],
        },
    });


</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        max-width: 600px;
        margin-top: 50px;
    }
    .form-row {
        display: flex;
        gap: 10px;
    }
    .form-group {
        flex: 1;
    }
    .form-group label {
        font-weight: bold;
    }

    .card {
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        background: white;
    }
</style>
