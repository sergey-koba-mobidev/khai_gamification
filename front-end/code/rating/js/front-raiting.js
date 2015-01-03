    $(document).ready(function() {
        //Глобальные переменные
        var ApiUrl = "../api/raiting.html";
        //................................................................

        //var groupId = getUrlParameter('group_id');
        var groupId = getUrlParameter();
        var departmId = 0;
        var discId = 0;
        var univerId = 0;

        function currentStudent(answerObj) {
            var i=false;
            var currentImgTemplate = _.template('<img src="../<%- photo %>" width="25px" height="25px" border="0" alt=" " />');
            var currentNameTemplate = _.template('<%- name %>');

            _.each(answerObj.students, function(obj) {
                if (i != false) return false;
                {
                    $(".ava1").html(currentImgTemplate(obj));
                    $(".name").html(currentNameTemplate(obj));
                    i=true;
                }
            });
        }

        function printStudentsInfo(answerObj) {
            //вывод рейтинга студентов
            var bests = '';
            var other = '';

            var i = 0;
            var len = answerObj.students.length;

            var bestTemplate = _.template($('#ratingTemplate').html());
            var otherTemplate = _.template($('#allTemplate').html());
            var starostaTemplate = _.template("<%- name %> <%- surname %>");

            _.each(answerObj.students, function(obj) {
                if (i > len) return false;
                {
                    if(i < 3) 
                    {
                        bests += bestTemplate(obj);
                        i++;
                    }
                    else 
                    { 
                        other += otherTemplate(obj);
                        i++;
                    }
                    if(obj.starosta==true) $("#starosta").html(starostaTemplate(obj));
                }
            });

            $("#bestBlock").html(bests);
            $("#otherBlock").html(other);
            $("#count_st").html(len);
        }

        function printGroupInfo(answerObj) {
            //вывод номера группы
            var grp = '';

            var groupTemplate = _.template("<%- name %>");
            var grPhotoTemplate = _.template($('#grPhotoTemp').html());

            _.each(answerObj.groups, function(obj){
                if(groupId==obj.id)
                {
                    $(".name_group_old").html("Рейтинг студентов группы "+groupTemplate(obj));
                    $(".name_group").html("Группа "+groupTemplate(obj));
                    $(".foto_group").html(grPhotoTemplate(obj));
                    departmId = obj.department_id;
                    
                }
            });

            _.each(answerObj.group_discipline, function(obj){
                if(groupId==obj.group_id)
                {
                    discId = obj.discipline_id;
                }
            });
        }

        function printDisciplineInfo(answerObj) {
            //вывод информации о специальности
            var disciplineTemplate = _.template("<%- name %>");

            _.each(answerObj.discipline, function(obj){
                if(discId==obj.id) $("#discipline").html(disciplineTemplate(obj));
            });
        }

        function printDepartmentInfo(answerObj) {
            //вывод информации о кафедре
            var departmentTemplate = _.template("<%- full_name %>");

            _.each(answerObj.departments, function(obj){
                if(departmId==obj.id) {
                    univerId = obj.university_id;
                    $("#depart").html(departmentTemplate(obj));
                }
            });
        }

        function printUniversitiesInfo(answerObj) {
            //вывод информации о университете
            var universiteTemplate = _.template("<%- full_name %>");
            var cityTemplate = _.template("<%- city %>");

            _.each(answerObj.universities, function(obj){
                if(univerId==obj.id) {
                    $(".name_univer").html(universiteTemplate(obj));
                    $("#citys").html(cityTemplate(obj));
                }
            });
        }

        function getUrlParameter()
		{
		    var sPageURL = window.location.pathname;
		    var sURLVariables = sPageURL.split('/');
            return sURLVariables[sURLVariables.length-1];
		}

        /*function getUrl(sParam)
        {
            var sPageURL = window.location.search.substring(1);
            var sURLVariables = sPageURL.split('&');
            for (var i = 0; i < sURLVariables.length; i++) 
            {
                var sParameterName = sURLVariables[i].split('=');
                if (sParameterName[0] == sParam) 
                {
                    return sParameterName[1];
                }
            }
        }*/

        function readInform(query) {
            $.ajax({
                type: "GET",
                url: ApiUrl,
                dataType: "json", // Преобразование text в JSON обьект
                success: function(data) {
                    printStudentsInfo(data);
                    printGroupInfo(data);
                    printDisciplineInfo(data);
                    printDepartmentInfo(data);
                    printUniversitiesInfo(data);
                    currentStudent(data);
                },
                error: function() {
                    alert('JSON load error');
                }
            });
        }

        function sendNum(query) {
            $.ajax({
                type: "POST",
                url: ApiUrl,
                dataType: "json", // Преобразование text в JSON обьект
                data: {
                    NumGroup: groupId
                },
                success: function(data) {
                    readInform();
                },
                error: function() {
                    alert('JSON load error');
                }
            });
        }

        //Обработка событий DOM динамически подгруженных данных через AJAX
        $('#bestBlock>*').live("click", function() {
            alert($(this).text());
        });
        
        $('#otherBlock>*').live("click", function() {
            alert($(this).text());
        });
        
        //Лучшие студенты
        readInform();
        ///////////////////////////////////////////////////////////////////////////////////
    });