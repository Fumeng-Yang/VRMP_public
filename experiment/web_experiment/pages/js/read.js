function setupReading(session, tdata, story, time2 = 30) {
    var readingStartTime = new Date().getTime()

    var index = 0,
        count = 0,
        timers = new Array(tdata.length)
    for (var i = 0; i < timers.length; i++) {
        timers[i] = {
            "lastover": 0,
            "duration": 0,
            "currout": 0
        };
    }
    // console.log(settings)
    var cells = d3.select("#secondboard")
        .style("display", "none")
        .selectAll("div")
        .data(tdata)
        .enter()
        .append("div")
        .attr("id", function(d, i) {
            return "reading_cell" + i
        })
        .attr("class", "reading_cell")
        .style("opacity", 0.7)
        .style("filter", "blur(5px)")
        .on("mouseover", function(d, i) {
            d3.select(this).style("opacity", 1).style("filter", "none")
            timers[i].lastover = new Date().getTime()
        })
        .on("mouseout", function(d, i) {
            count++
            d3.select(this).style("opacity", 0.7).style("filter", "blur(5px)")
            if (timers[i].lastover > 0) {
                timers[i].currout = new Date().getTime()
                timers[i].duration += timers[i].currout - timers[i].lastover
                timers[i].lastover = 0
            } else {
                console.error("ERROR: mouse out happen before mouse over for " + i)
            }
        })

    if (settings.groupid == "group1") {
        cells.append("div")
            .style("height", "30px")
            .style("margin-bottom", "7px")
            .style("border-radius", "10px")
            .style("border-style", "solid")
            .style("border-width", "1px")
            .attr("id", function(d, i) {
                return "palace_position" + i
            })
            .append("p")
            .style("margin", "7px")
            .attr("class", "readingHeader")
            .html(function(t, i) {
                return data[story][i]
            })
    }

    cells.append("div")
        .style("margin-bottom", "100px")
        .style("height", "380px")
        .style("border-radius", "10px")
        .style("border-style", "solid")
        .style("border-width", "1px")
        .attr("id", function(d, i) {
            return "reading_abstract" + i
        })
        .append("p")
        .style("margin", "7px")
        .html(function(t, i) {
            return "<b> Title</b>: " + t.title + ""
        })
        .append("p")
        .html(function(t) {
            // t.abstract is a set of sentences
            return "<b>Body</b>: " + t.abstract.join(" ")
        })


    d3.select("#next-button")
        .on("click", function() {
            if (index == 0) {
                d3.select("#firstboard")
                    .style("display", "none")

                d3.select("#secondboard")
                    .style("display", "block")

                // start timer
                var trigger = setInterval(function() {
                    if (time2 > 0) time2--
                    d3.select("#timer")
                      .text(time2)
                    }, globalDebugging ? 1000 : 1000 * 60)
                timeintervals.push(trigger)

                var stout = setTimeout(function() {
                    d3.selectAll(".reading_cell")
                    .style("opacity", 0.7)
                    .style("filter", "blur(5px)")
                    .on("mouseover", function(){})

                    var readingEndTime = new Date().getTime()
                    data['timeStamps'][session] = {}
                    data['timeStamps'][session]['readingTime'] = +readingEndTime - +readingStartTime
                    data['timeStamps'][session]['readingEndTime'] = readingEndTime
                    data['timeStamps'][session]['readingStartTime'] = readingStartTime
                    data['timeStamps'][session]['readingDetailedTime'] = timers

                    setTimeout(function(){
                        alert("Sorry! Time out for reading!")
                        nextPage()
                    }, 50);

                    //nextPage()
                }, globalDebugging ? 1000 * time2 : 1000 * 60 * time2)
                timeouts.push(stout)
            } else {
                if (count < tdata.length) {

                } else {
                    var readingEndTime = new Date().getTime()
                    data['timeStamps'][session] = {}
                    data['timeStamps'][session]['readingTime'] = +readingEndTime - +readingStartTime
                    data['timeStamps'][session]['readingEndTime'] = readingEndTime
                    data['timeStamps'][session]['readingStartTime'] = readingStartTime
                    data['timeStamps'][session]['readingDetailedTime'] = timers
                    nextPage();
                }
            }
            index++
        })
}