$(document).ready(function(){
    var data1 = [12, 3, 4, 2, 12, 3, 4, 17, 22, 34, 54, 67];
    var data2 = [3, 9, 12, 14, 22, 32, 45, 12, 67, 45, 55, 7];
    var data3 = [23, 19, 11, 134, 242, 352, 435, 22, 637, 445, 555, 57];
    var data4 = [13, 19, 112, 114, 212, 332, 435, 132, 67, 45, 55, 7];

    $("#chart3").shieldChart({
        exportOptions: {
            image: false,
            print: false
        },
        axisY: {
            title: {
                text: "Vente en millier de dollar"
            }
        },
        axisX: {
            title: {
                text: "Jours"
            }
        },
        dataSeries: [{
            seriesType: "area",
            data: data3
        }]
    });
});
