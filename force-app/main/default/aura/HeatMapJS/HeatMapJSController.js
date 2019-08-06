({
	scriptsLoaded : function(component, event, helper) {
        
        var colors = [
            'rgba(23, 48, 91, 1)',
            'rgba(62, 159, 222, 1)',
            'rgba(48, 165, 154, 1)',
            'rgba(132, 220, 214, 1)',
            'rgba(222, 159, 0, 1)',
            'rgba(223, 205, 114, 1)',
            'rgba(223, 205, 119, 1)',
            'rgba(132, 99, 214, 1)',
            'rgba(132, 123, 214, 1)',
            'rgba(132, 243, 214, 1)',
            'rgba(132, 190, 214, 1)',
            'rgba(132, 199, 214, 1)'
        ];
        
        var data = {
            labels: ['Prod1','Prod2','Prod3','Prod4','Prod5','Prod6','Prod7','Prod8','Prod9','Prod10','Prod11','Prod12'],
            datasets : [
            {
              label: 'Account 1',
              data: [8, 6, 5, 7, 9, 8, 1, 6, 3, 3, 8, 7],
                fill: false,
                borderWidth: 1.5,
                backgroundColor: colors[2],
                borderColor: colors[1],
                pointBackgroundColor: "#FFFFFF",
                pointBorderWidth: 4,
                pointHoverRadius: 8,
                pointRadius: 6,
                pointHitRadius: 10
            },
            {
              label: 'Account 2',
              data: [6, 8, 5, 6, 5, 5, 7, 0, 0, 3, 0, 7],
                fill: false,
                borderWidth: 1.5,
                backgroundColor: colors[2],
                borderColor: colors[1],
                pointBackgroundColor: "#FFFFFF",
                pointBorderWidth: 4,
                pointHoverRadius: 8,
                pointRadius: 6,
                pointHitRadius: 10
            },
            {
              label: 'Account 3',
              data: [8, 5, 6, 4, 2, 2, 3, 0, 2, 0, 10, 8],
                fill: false,
                borderWidth: 1.5,
                backgroundColor: colors[1],
                borderColor: colors[2],
                pointBackgroundColor: "#FFFFFF",
                pointBorderWidth: 4,
                pointHoverRadius: 8,
                pointRadius: 6,
                pointHitRadius: 10
            },
            {
              label: 'Account 4',
              data: [4, 0, 7, 4, 6, 3, 2, 4, 2, 10, 8, 2],
                fill: false,
                borderWidth: 1.5,
                backgroundColor: colors[2],
                borderColor: colors[1],
                pointBackgroundColor: "#FFFFFF",
                pointBorderWidth: 4,
                pointHoverRadius: 8,
                pointRadius: 6,
                pointHitRadius: 10
            },
            {
              label: 'Account 5',
              data: [1, 0, 0, 7, 0, 4, 1, 3, 4, 5, 1, 10],
                fill: false,
                borderWidth: 1.5,
                backgroundColor: colors[3],
                borderColor: colors[2],
                pointBackgroundColor: "#FFFFFF",
                pointBorderWidth: 4,
                pointHoverRadius: 8,
                pointRadius: 6,
                pointHitRadius: 10	
            }
          ]
        };
    
    var options ={colorInterpolation: "pallete",
                  colors:colors};
    
    
     var ctx = component.find("chart").getElement().getContext('2d');

	var newChart = new Chart(ctx).HeatMap(data, options);
		
	}
})