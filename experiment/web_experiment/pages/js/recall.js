function setupRecall(session, tdata, time1 = 30) {

    var index = 0,
        lastClick = {
            "type": 0,
            "timestamp": 0,
            "index": -1
        }
    titleTimers = new Array(tdata.length)
    abstractTimers = new Array(tdata.length)
    for (var i = 0; i < titleTimers.length; i++) {
        titleTimers[i] = {
            "lastTimestamp": 0,
            "duration": 0
        }
        abstractTimers[i] = {
            "lastTimestamp": 0,
            "duration": 0
        }
    }
    var recallStartTime = new Date().getTime()

    d3.select("#secondboard")
        .style("display", "none")

    function computeTime2() {
        var recall_titles = d3.selectAll(".recall_title_field").nodes().map(function(t, i) {
            return t.value;
        })
        var recall_abstracts = d3.selectAll(".recall_abstract_field").nodes().map(function(t, i) {
            return t.value;
        })
        data[session] = {}
        data['timeStamps'][session] = {}
        data[session].recallEntries = recall_titles.map(function(e, i) {
            var vivid = d3.select("#vivid_slider" + i).node();
            return {
                "title": e,
                "abstract": recall_abstracts[i],
                "vivid": vivid.value,
                "index": i
            }
        })

        var recallEndTime = new Date().getTime()
        data['timeStamps'][session]['recallTime'] = +recallEndTime - +recallStartTime
        data['timeStamps'][session]['recallEndTime'] = +recallEndTime
        data['timeStamps'][session]['recallStartTime'] = +recallStartTime
        data['timeStamps'][session]['recallDetailedTime'] = {
            "abstracts": abstractTimers,
            "titles": titleTimers
        }
    }

    d3.select("#next-button")
        .on("click", function() {
            if (index == 0) {
                var stout = setTimeout(function() {
                    d3.selectAll("textarea")
                    .attr("disabled", true)
                    
                    computeTime2()

                    setTimeout(function(){
                        alert("Sorry! Time out for recalling!")
                        nextPage()
                    }, 50);
  
                    //nextPage()
                }, globalDebugging ? 1000 * time1 : 1000 * 60 * time1)

                timeouts.push(stout)

                var trigger = setInterval(function() {
                    if (time1 > 0) time1--
                    d3.select("#timer")
                      .text(time1)
                }, globalDebugging ? 1000 : 1000 * 60)

                timeintervals.push(trigger)

                d3.select("#firstboard")
                    .style("display", "none")

                d3.select("#secondboard")
                    .style("display", "block")

                var cells = d3.select("#sortable")
                    .selectAll("li")
                    .data(tdata)
                    .enter()
                    .append("li")
                    .style("list-style", "none")
                    .style("width", "900px")
                    .style("min-width", "900px")
                    .style("max-width", "900px")
                    .style("height", "450px")
                    .style("min-height", "450px")
                    .style("margin-left", "-50px")
                    .style("margin-bottom", "100px")
                    .attr("id", function(d, i) {
                        return "recall_cell" + i
                    })
                    .append("div")
                    .attr("class", "recall_cell")
                    .style("width", "900px")
                    .style("min-width", "900px")
                    .style("max-width", "900px")
                    .style("height", "450px")
                    .style("min-height", "450px")
                    .style("position", "absolute")
                    .style('margin-bottom', "10px")
                    .style("border-radius", "10px")
                    .style("border-style", "solid")
                    .style("border-width", "1px")
                    .style("border-color", function(d, i) {
                        return "black";
                    })
                    .on('mouseover', function() {
                        d3.select(this)
                            .style('background-color', '#EEEEEE')
                            .style('cursor', 'move')
                    })
                    .on('mouseout', function() {
                        d3.select(this)
                            .style('background-color', 'white')
                            .style('cursor', 'default')
                            .attr("disabled", false)

                        // A hack to make sure it stays in white... not very sure what happens in sortable
                        d3.selectAll("textarea")
                            .style("background-color", "white")
                    })


                cells.append("textarea")
                    .attr("rows", "2")
                    .attr("cols", "92")
                    .attr("class", "recall_title_field")
                    .style("resize", "none")
                    .style('margin-top', "7px")
                    .style('margin-left', "7px")
                    .style('margin-right', "7px")
                    .style('font-size', "13pt")
                    .attr("placeholder", "Title")
                    .attr("id", function(d, i) {
                        return "recall_title" + i
                    })
                    .on("input", function(d, i) {
                        var e = d3.event
                        if (titleTimers[i].lastTimestamp > 0) {
                            titleTimers[i].duration += e.timeStamp - titleTimers[i].lastTimestamp
                        }
                        titleTimers[i].lastTimestamp = e.timeStamp
                    })

                cells.append("textarea")
                    .attr("rows", "15")
                    .attr("cols", "92")
                    .attr("class", "recall_abstract_field")
                    .style("resize", "none")
                    .style('margin-left', "7px")
                    .style('margin-right', "7px")
                    .style('font-size', "13pt")
                    .attr("placeholder", "Body")
                    .attr("id", function(d, i) {
                        return "recall_field" + i
                    })
                    .on("input", function(d, i) {
                        var e = d3.event
                        if (abstractTimers[i].lastTimestamp > 0) {
                            abstractTimers[i].duration += e.timeStamp - abstractTimers[i].lastTimestamp
                        }
                        abstractTimers[i].lastTimestamp = e.timeStamp
                    })

                var slider = cells.append("div")
                    .style('margin', "7px")
                    .style("display", function() {
                        if (settings.groupid == "group0")
                            return 'none'
                        else
                            return "inline"
                    })
                    .append("span")
                    .style('margin-left', "7px")
                    .html("<br> &nbsp;How vivid this illustration is? &nbsp;")

                slider.append("text")
                    .text(" 0%")
                slider.append("input")
                    .attr("type", "range")
                    .attr("value", function() {
                        if (settings.groupid == "group0")
                            return '-1'
                        else
                            return "4"
                    })
                    .attr("min", "1")
                    .attr("max", "7")
                    .attr("step", "1")
                    .attr("list", "ticks")
                    .attr("class", "slider")
                    .attr("id", function(d, i) {
                        return "vivid_slider" + i
                    })
                    .style("display", "table-cell")
                    .style("width", "140px")
                    .style('height', "17px")
                    .style('margin-top', "7px")
                    .style("opacity", "0.7")
                    .style("background", "lightgray")

                slider.append("text")
                    .text("100% (most)")


                index++;
            } else {
                computeTime2()
                nextPage()
            }
        })

    // a hack to make sure that this calls after we load all items
    setTimeout(function() {
        $("#sortable").sortable();
    }, 50)
}