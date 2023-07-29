// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.
// Write your JavaScript code.
import $ from 'jquery';

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
    $(".k-editable-area iframe").contents().find("body").css("font-family", "Fira Sans");
    setTimeout(function () {
        $("#labtestgrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
        $("#usergrid .k-grid-content").attr("style", "max-height: calc(100vh - " + userGridMargin() + "px) !important; height:100% !important");
        $("#patientgrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
        $("#casegrid .k-grid-content").attr("style", "max-height: calc(100vh - " + caseGridMargin() + "px) !important; height:100% !important");
        $("#labcasegrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 315 + "px) !important; height:100% !important");
        $("#doctorgrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 255 + "px) !important; height:100% !important");
        $("#consultantgrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 255 + "px) !important; height:100% !important");
        $("#receptioncasegrid .k-grid-content").attr("style", "max-height: calc(100vh - " + receiptionCaseGridMargin() + "px) !important; height:100% !important");
        $("#reportcasegrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 325 + "px) !important; height:100% !important");
        $("#expensegrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
        $("#categorygrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
        $("#groupgrid .k-grid-content").attr("style", "max-height: calc(100vh - " + 250 + "px) !important; height:100% !important");
        $('[data-toggle=popover]').popover();
    }, 100);
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

/* HTML document is loaded. DOM is ready.
-------------------------------------------*/

function NumberFormatter(number) {
    if (number > 1000000) {
        return kendo.toString((number / 1000000), 'n2') + 'M';
    }
    else {
        return kendo.toString(number, 'n0'); // if value < 1000, nothing to do
    }
}
function SmallNumberFormatter(number) {
    if (number > 999 && number < 1000000) {
        return kendo.toString((number / 1000), 'n2') + 'K'; // convert to K for number from > 1000 < 1 million
    } else if (number > 1000000) {
        return kendo.toString((number / 1000000), 'n2') + 'M';
    } else if (number < 900) {
        return kendo.toString(number, 'n0'); // if value < 1000, nothing to do
    }
    else {
        return number;
    }
}

$(function () {

    /* start typed element */
    //http://stackoverflow.com/questions/24874797/select-div-title-text-and-make-array-with-jquery
    // var subElementArray = $.map($('.sub-element'), function (el) { return $(el).text(); });
    // $(".element").typed({
    //     strings: subElementArray,
    //     typeSpeed: 30,
    //     contentType: 'html',
    //     showCursor: false,
    //     loop: true,
    //     loopCount: true,
    // });
    /* end typed element */

    /* Smooth scroll and Scroll spy (https://github.com/ChrisWojcik/single-page-nav)    
    ---------------------------------------------------------------------------------*/

    // $('.templatemo-nav').singlePageNav({
    //     offset: $(".templatemo-nav").height(),
    //     filter: ':not(.external)',
    //     updateHash: false
    // });

    /*    $(".spa-nav").on("click", function () {
            let id = $(this).attr("href");
            document.querySelector(id).scrollIntoView({
                behavior: 'smooth'
            });
        });*/

    /* start navigation top js */
    // $(window).scroll(function () {
    //     let height = $("header").height() + 34;
    //     if ($(this).scrollTop() > height) {
    //         $(".templatemo-nav").addClass("sticky");
    //     }
    //     else {
    //         $(".templatemo-nav").removeClass("sticky");
    //     }
    // });

    /* Hide mobile menu after clicking on a link
    -----------------------------------------------*/
    $('.navbar-collapse a').click(function () {
        $(".navbar-collapse").collapse('hide');
    });
    /* end navigation top js */

    $('body').bind('touchstart', function () { });

    // $("#dtTo").kendoDatePicker();
    // $("#dtFrom").kendoDatePicker();



    /* wow
    -----------------*/
    // new WOW().init();
});

function caseGridMargin() {
    if (window.innerWidth < 576) {
        $("#casegrid").css("margin-bottom", "15px");
        return 406;
    }
    else if (window.innerWidth > 575 && window.innerWidth < 768) {
        $("#casegrid").css("margin-bottom", "15px");
        return 355;
    }
    else {
        return 325;
    }
}

function receiptionCaseGridMargin() {
    if (window.innerWidth < 576) {
        return 410;
    }
    else if (window.innerWidth > 575 && window.innerWidth < 768) {
        return 355;
    }
    else {
        return 325;
    }
}
function userGridMargin() {
    if (window.innerWidth < 576) {
        return 335;
    }
    else if (window.innerWidth > 575 && window.innerWidth < 768) {
        return 355;
    }
    else {
        return 250;
    }
}
