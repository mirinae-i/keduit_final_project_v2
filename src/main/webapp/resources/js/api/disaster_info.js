$(function () {
    load();
});

function load() {
    $.ajax({
        url: '/api/disaster_info_ajax',
        type: 'GET',
        success: function (data) {
            console.log('** Ajax Success! **');
            console.log(data);
            let thead = '<tr>';
            let tbody = '';
            let is_thead_printed = false;
            for (let item of data.row) {
                for (let key in item) {
                    if (key == 'create_date') {
                        key = '알림 발생 시각';
                        thead += '<th>' + key + '</th>';
                    } else if (key == 'msg') {
                        key = '메시지';
                        thead += '<th>' + key + '</th>';
                    } else {
                        continue;
                    }
                }
                is_thead_printed = true;
                if (is_thead_printed) {
                    thead += '</tr>';
                    break;
                }
            }
            for (let item of data.row) {
                tbody += '<tr>';
                for (let key in item) {
                    // tbody += "<td>" + item[key] + "</td>";
                    if (key == 'create_date') {
                        tbody += '<td>' + item['create_date'] + '</td>';
                    } else if (key == 'msg') {
                        tbody += '<td>' + item['msg'] + '</td>';
                    } else {
                        continue;
                    }
                }
                tbody += '</tr>';
            }
            $('#thead_area').append(thead);
            $('#tbody_area').append(tbody);
        },
        error: function (e) {
            console.log('** Ajax Fail! **');
            console.log(e);
        },
    });
}
