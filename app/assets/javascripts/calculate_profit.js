$(document).ready(function() {
  $('#calculate_profit').on("click", function() {
    data = $('#invest_sum').val();
    $.ajax({
      type: 'post',
      url: '/calculate_profit',
      dataType: 'json',
      data: { invest_sum: data },
      success: function(json) {
        optimistic_profit = +json.optimistic;
        realistic_profit = +json.realistic;
        realistic_percent = +json.realistic_percent;
        $('#result').text("");
        $('#result').append("<p>При вложении " + data + " ваша годовая доходность составит:</p>");
        $('#result').append("<p>Оптимистично: <strong>" + optimistic_profit.toFixed(2) + "</strong></p>");
        $('#result').append("<p>Реалистично: <strong>" + realistic_profit.toFixed(2) + "</strong>  (на основании исторических данных)</p>");
        $('#realistic_percent').text(" " + realistic_percent.toFixed(2) + "%");
      }
    });
  });
});