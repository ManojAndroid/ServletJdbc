 
    /****************this is to edit the user**********************/
    function EditUser(id) {
        $.ajax({
            url: "@Url.Action("EditUser", "Home")" + "?id=" + id,
            data: "userId=" + id,
            success: function (result) {
                $("#divEditUser").html(result);
                $("#divEditUser").dialog("open");
            }
        });
 
    }
    /*******************this is used to start the overlay(loader)***********************/
    function loaderStart() {
        $('#loader').show();
    }
    /*******************this is used to stop the overlay(loader)***********************/
    function loaderStop() {
        setTimeout('$("#loader").hide()', 100);
    }
 
    /****************this is to delete the user**********************/
    function DeleteUser(id) {
        var r = confirm("Do you want to delete this User?");
 
        if (r == true) {
            $.ajax({
                type: "POST",
                url: "/Home/DeleteUser",
                async: false,
                data: "userId=" + id,
                success: function (data) {
                    if (data == 'True') {
                        RefreshGrid();
                        alert('User deleted successfully.');
                    }
                    else {
                        alert('Some error is occured while deleting.');
                    }
                }
 
            });
        }
    }
 
    /********************To refresh grid****************/
    function RefreshGrid() {
        $("#list").jqGrid().setGridParam({
            url: '/Home/LinqGridData/',
            datatype: 'json'
        }).trigger("reloadGrid");
    }
 
    $(function () {
        /******************this is used to add new user*******************/
        $("#AddUser").click(function () {
 
            $.ajax({
                url: "@Url.Action("EditUser", "Home")" + "?id=" + 0,
                success: function (result) {
                    $("#divEditUser").html(result);
                    $("#divEditUser").dialog("open");
                }
            });
        });
 
        /******************this is used to open dialog for user Add/Edit*******************/
        $("#divEditUser").dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "explode",
                duration: 1000
            }
        });
        /******************this is used to show user*******************/
        $("#list").jqGrid({
            url: '/Home/LinqGridData/',
            datatype: 'json',
            mtype: 'GET',
            colNames: ['Id', 'Name', 'Email', 'Action'],
            colModel: [
          { name: 'Id', index: 'Id', width: 120, align: 'center', hidden: true },
          { name: 'Name', index: 'Id', width: 170, align: 'center' },
         { name: "Email", index: 'Email', width: 170, align: 'center' },
          { name: 'act', width: 138, sortable: false }
            ],
            pager: $('#pager'),
            rowNum: 5,
            rowList: [5, 10, 15, 20, 50],
            sortname: 'Id',
            sortorder: 'desc',
            sortable: true,
            height: "100%",
            viewrecords: true,
            imgpath: '',
            caption: 'User List',
            gridComplete: function () {
                var ids = $("#list").jqGrid('getDataIDs');
                var myCellData;
                for (var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    var grid = $('#list');
                    myCellData = grid.jqGrid('getCell', cl, 'Id');
                    ed = "<input style='height:30px;width:50px;' type='button' value='Edit' onclick=\"EditUser(" + myCellData + ");\" />";
                    de = "<input style='height:30px;width:70px;' type='button' value='Delete' onclick=\"DeleteUser(" + myCellData + ");\" />";
                    $("#list").jqGrid('setRowData', ids[i], { act: ed + "|" + de });
                }
            }
        });
    });
</script>