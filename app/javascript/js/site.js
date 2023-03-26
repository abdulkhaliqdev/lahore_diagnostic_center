// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
// Write your JavaScript code.
$(document).ready(function () {
    // usergrid add button
    $("#usergrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateUser();
    });
    $("#casegrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateCase();
    });


    $("#userform").on("submit", function (e) {
        if ($("#userform").valid()) {
            SaveUser(e);
        }

        return false;
    });
    $("#doctorform").on("submit", function (e) {
        if ($("#doctorform").valid()) {
            SaveDoctor(e);
        }

        return false;
    });
    $("#groupform").on("submit", function (e) {
        if ($("#groupform").valid()) {
            SaveGroup(e);
        }

        return false;
    });
    $("#categoryform").on("submit", function (e) {
        if ($("#categoryform").valid()) {
            SaveCategory(e);
        }

        return false;
    });
    $("#expenseform").on("submit", function (e) {
        if ($("#expenseform").valid()) {
            SaveExpense(e);
        }

        return false;
    });
    $("#consultantform").on("submit", function (e) {
        if ($("#consultantform").valid()) {
            SaveConsultant(e);
        }

        return false;
    });
    $("#caseform").on("submit", function (e) {
        SaveCase(e);
        return false;
    });
    $("#testform").on("submit", function (e) {
        if ($("#testform").valid()) {
            SaveTest(e);
        }

        return false;
    });
    $("#labtestgrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateTest();
    });
    $("#doctorgrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateDoctor();
    });
    $("#groupgrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateGroup();
    });
    $("#categorygrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateCategory();
    });
    $("#expensegrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateExpense();
    });
    $("#consultantgrid .k-grid-add").on("click", function (e) {
        e.preventDefault();
        CreateConsultant();
    });
    $("#patientForm").on("submit", function (e) {
        if ($("#patientForm").valid()) {
            SavePatient(e);
        }

        return false;
    });
    $("#passwordform").on("submit", function (e) {
        if ($("#passwordform").valid()) {
            SavePassword(e);
        }

        return false;
    });
    //$("#caseForm").on("submit", function (e) {
    //    if ($("#caseForm").valid()) {
    //        SaveCase(e);
    //    }

    //    return false;
    //});
    $("#patientForm #Phone").add("#patientForm #PatientNumber").on("blur", function (e) {
        SearchPatient(e);
        return false;
    }).on("keypress", function (e) {
        if (e.which == 13) {
            SearchPatient(e);
            return false;
        }
    });

    //    setTimeout(function () { 
    //var editorBody = $(".k-editable-area iframe").contents().find("body");
    //editorBody.css("font-family", "Arial");
    //      console.log($(".k-editable-area iframe").contents().find("body"));
    // $(".k-editable-area iframe").contents().find("body").css("font-family", "Fira Sans");
    // setTimeout(function () {
    //     $("#labtestgrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
    //     $("#usergrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + userGridMargin() + "px) !important; height:100% !important");
    //     $("#patientgrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
    //     $("#casegrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + caseGridMargin() + "px) !important; height:100% !important");
    //     $("#labcasegrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 315 + "px) !important; height:100% !important");
    //     $("#doctorgrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 255 + "px) !important; height:100% !important");
    //     $("#consultantgrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 255 + "px) !important; height:100% !important");
    //     $("#receptioncasegrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + receiptionCaseGridMargin() + "px) !important; height:100% !important");
    //     $("#reportcasegrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 325 + "px) !important; height:100% !important");
    //     $("#expensegrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
    //     $("#categorygrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
    //     $("#groupgrid .k-grid-content")?.attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
    //     $('[data-toggle=popover]').popover();
    // }, 100);
    //}, 3000);
});

function ConsultantFiltering(ev) {
    var filterValue = ev.filter != undefined ? ev.filter.value : "";
    ev.preventDefault();

    this.dataSource.filter({
        logic: "or",
        filters: [
            {
                field: "Name",
                operator: "contains",
                value: filterValue
            }
        ]
    });
}
function DoctorFiltering(ev) {
    var filterValue = ev.filter != undefined ? ev.filter.value : "";
    ev.preventDefault();

    this.dataSource.filter({
        logic: "or",
        filters: [
            {
                field: "Name",
                operator: "contains",
                value: filterValue
            }
        ]
    });
}
function LoadDoctorFilter() {
    var doc = $("#cbDoctor").data("kendoComboBox");
    if (doc == null) {
        $("#cbDoctor").kendoComboBox({
            dataTextField: "Name",
            dataValueField: "Id",
            filter: "contains",
            minLength: 3,
            placeholder: "Doctor",
            filtering: DoctorFiltering,
            change: function () {
                var grid = $("#reportcasegrid").data("kendoGrid");
                if (grid == null) {
                    grid = $("#casegrid").data("kendoGrid");
                }
                grid.dataSource.read();
            },
            dataSource: {
                type: 'json',
                transport: {
                    read: {
                        url: '/Admin/GetDoctorsDD'
                    }
                }
            }
        });
    }
}
function LoadConsultantFilter() {
    var doc = $("#cbConsultant").data("kendoComboBox");
    if (doc == null) {
        $("#cbConsultant").kendoComboBox({
            dataTextField: "Name",
            dataValueField: "Id",
            filter: "contains",
            placeholder: "Referrer",
            minLength: 3,
            filtering: ConsultantFiltering,
            change: function () {
                var grid = $("#casegrid").data("kendoGrid");
                grid.dataSource.read();
            },
            dataSource: {
                type: 'json',
                transport: {
                    read: {
                        url: '/Admin/GetConsultantsDD'
                    }
                }
            }
        });
    }
}