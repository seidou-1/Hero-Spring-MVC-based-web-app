$(document).ready(function () {

        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/loadWindow',
            success: function (data) {
                console.log(data);
            },
            error: function () {
                console.log("Error Finding Data!");
            }
        });
});