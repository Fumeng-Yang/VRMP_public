function setupRecognition(session, sdata) {
    var index = 0
    var recognitionStartTime = new Date().getTime();
    var ratedConfidence = new Array(sdata.length)
    ratedConfidence.fill(0)

    if (settings.day === "day1") {
        d3.select("#whenisthis")
            .text("just now")
    } else if (settings.day === "day2") {
        d3.select("#whenisthis")
            .text("yesterday")
    }

    d3.select("#recognition_num")
        .html(sdata.length)

    d3.select("#secondboard")
        .style("display", "none")

    d3.select("#next-button")
        .on("click", function() {
            d3.select("#warning")
                .html("")
            if (index == 0) {
                d3.select("#firstboard")
                    .style("display", "none")

                d3.select("#secondboard")
                    .style("display", "block")

                var tds = d3.select("#sentenceboard")
                    .select("tbody")
                    .selectAll("str")
                    .data(sdata)
                    .enter()
                    .append("tr")
                    .attr("class", function(d, i) {
                        return "str cell_" + ((i + 1) % 2)
                    })

                tds.append("td")
                    .attr("class", "cell_sentence")
                    .append("p")
                    .style("margin", "5pt")
                    .html(function(d) {
                        return d.sentence + "";
                    })
                    .attr("id", function(d, i) {
                        return "cell_sentence" + i
                    })

                tds.append("td")
                    .attr("class", "cell_yes")
                    .attr("align", "center")
                    .style("width", "40px")
                    .attr("id", function(d, i) {
                        return "cell_yes" + i
                    })
                    .append("input")
                    .attr("value", "yes")
                    .attr("type", "radio")
                    .attr("name", function(d, i) {
                        return "sentence" + i;
                    })
                    .attr("class", "tested_radio")

                tds.append("td")
                    .attr("class", "cell_no")
                    .attr("align", "center")
                    .style("width", "40px")
                    .attr("id", function(d, i) {
                        return "cell_no" + i
                    })
                    .append("input")
                    .attr("type", "radio")
                    .attr("value", "no")
                    .attr("name", function(d, i) {
                        return "sentence" + i;
                    })

                var conf = tds.append("td")
                    .attr("class", "cell_confidence")
                    .attr("align", "center")
                    .style("width", "120px")
                    .attr("id", function(d, i) {
                        return "cell_confidence" + i
                    })
                    .append("div")
                    .style("display", "table")

                conf.append("input")
                    .attr("type", "range")
                    .attr("value", "4")
                    .attr("min", "1")
                    .attr("max", "7")
                    .attr("step", "1")
                    .attr("name", function(d,i){
                        return "conf" + i
                    })
                    .attr("list", "ticks")
                    .attr("class", "slider")
                    .attr("id", function(d, i) {
                        return "conf_slider" + i
                    })
                    .style("display", "table-cell")
                    .style("width", "140px")
                    .style("opacity", "0.7")
                    .style("background", "lightgray")
                    .on("input", function(d, i) {
                            // console.log(2)
                        ratedConfidence[i]++
                    })

                index++;
            } else { // save data and move on
                var recognitionAnswer = [],
                    countUnselected = 0,
                    countRated = 0
                sdata.forEach(function(s, i) {
                    var sentence = d3.select("input[name=sentence" + i + "]:checked").node();
                    var conf = d3.select("#conf_slider" + i).node()
                    if (sentence != null) {
                        recognitionAnswer.push({
                            "index": i,
                            "answer": sentence.value,
                            "type": s.type,
                            "confidence": conf.value
                        });
                    } else {
                        countUnselected++;
                    }
                    console.log(ratedConfidence[i])
                    if (ratedConfidence[i] != 0) {
                        countRated++
                    }
                });
                console.log(countUnselected + ";" + countRated)
                // console.log(settings["sentences_" + settings.day])
                if (globalDebugging || (countUnselected == 0 && countRated > sdata.length / 2)) {
                    // save data
                    data[session] = {}
                    data[session]['recognitionAnswer'] = recognitionAnswer
                    var recognitionEndTime = new Date().getTime();
                    data['timeStamps'][session] = {}
                    data['timeStamps'][session]['recognitionTime'] = +recognitionEndTime - +recognitionStartTime
                    data['timeStamps'][session]['recognitionEndTime'] = recognitionEndTime
                    data['timeStamps'][session]['recognitionStartTime'] = recognitionStartTime
                  
                    nextPage();
                } else {
                    d3.select("#warning")
                        .html("You haven't answered all of them.")
                }
            }
        })

    if (globalDebugging) {
        d3.selectAll(".tested_radio")
            .property("checked", "checked")
    }
}