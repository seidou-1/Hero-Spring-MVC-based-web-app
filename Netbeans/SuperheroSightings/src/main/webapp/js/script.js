
$(document).ready(function () {

    // setResults(null);
 


    $(".characterSortModal").on('shown.bs.modal', () => { 
        $('#characterSubmit').click(() => {
            var characters = "";
            arrOfCharacters = [];
            $(".charactersSelect:checked").each((index, element) => {
                characters += $(element).val() + "_";
                arrOfCharacters.push(+$(element).val());
            }); 
       
        });
    });

    var arrOfCharacters = [];

    $(".characterSortModal").on('hide.bs.modal', () => {
        loadSelectedCharacters(arrOfCharacters);
    });


    $('#confirmDelete').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    })

    loadEndpointsForSightings();
    loadPills("organizations");
    var organizationSave = $("#saveOrganizations");
    organizationSave.click(function () {
        loadPills("organizations");
    });

    var superPowersSave = $("#savePowers");
    superPowersSave.click(function () {
        loadPills("superPowers");
    });

    $(".clickable-row").click(function () {

        window.location = $(this).data("href");
    });
});
function removeChecks(pill) {
   var allOfType;
   var pillType = pill.dataset.source;
       
   if (pillType === "organizations") {
       allOfType = $(".organizationSelection");

  } else {
      allOfType = $(".superPowerSelection");
  }

   allOfType.each((index, element) => {
       if ($(element)[0].value === pill.dataset.type) {
           $(element)[0].checked = false;
       }
   });
   loadPills(pillType);

}

function loadPills(pillType) {
   var display, allOfType;

   if (pillType === "organizations") {
       display = $("#myOrganizations");
       allOfType = $(".organizationSelection");
       
   } else {
       display = $("#mySuperPowers");
       allOfType = $(".superPowerSelection");
       stringDisplay = "super";
   }


   display.empty();
   allOfType.each((index, element) => {
       if ($(element)[0].checked) {
           // console.log($(element)[0].dataset.name)
           display.append(preparePill($(element)[0],pillType));
       }
   });
}
// var showing = "#map";
// var hiding = "#sightingsTable";
// function toggleMap() {
//     $(showing).css({ "display": "none" });
//     $(hiding).css({ "display": "" });
//     showing = (showing == "#map") ? "#sightingsTable" : "#map";
//     hiding = (hiding == "#sightingsTable") ? "#map" : "#sightingsTable";
// }
function removePill(pill) {
   removeChecks($(pill)[0]);
}


function preparePill(data, pill) {
   
   return `</div>
           <div class="col-md-5 pill">
           <div class="closePill" onclick="removePill(this)" data-source="${data.dataset.pill}" data-type="${data.value}">
           <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
           </div>
           <div class="pillData">
           ${data.dataset.name}
           </div>
           </div>
           </div>`;
}

/* Load checkboxes for various restpoints */
function loadEndpointsForSightings() {
    var organizationChoice = $('#organizationChoice');
    var locationChoice = $('#locationChoice');
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/SuperheroSightings/organizations',
        success: function (data) {
            data.forEach(e => {
                organizationChoice.append(` <label>
                <input type="checkbox" class="organizationSelection" name="organizations" data-name="${e.organizationName} " value="${e.organizationId}"> ${e.organizationName}
                </label><br>`);
            })
        },
        error: function () {
            console.log("Problems found")
        }
    });
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/SuperheroSightings/locations',
        success: function (data) {
            data.forEach(e => {
                locationChoice.append(` <label>
                <input type="checkbox" value="${e.locationID}"> ${e.locationName}
                </label><br>`);
            })
        },
        error: function () {
            console.log("Problems found")
        }
    });
}
// Credits to https://tympanus.net/codrops/2015/09/15/styling-customizing-file-inputs-smart-way/
var inputs = document.querySelectorAll('.inputfile');
Array.prototype.forEach.call(inputs, function (input) {
    var label = input.nextElementSibling,
            labelVal = label.innerHTML;
    input.addEventListener('change', function (e) {
        var fileName = '';
        if (this.files && this.files.length > 1) {
            fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
        } else {
            fileName = e.target.value.split('\\').pop();
        }
        if (fileName) {
            label.querySelector('span').innerHTML = "true nuh";
            label.querySelector('span').innerHTML = fileName;
        } else {
            label.innerHTML = labelVal;
        }
    });
});
function setLocation() {
    // var imagesToUpload = $("#imagesToUpload");
    console.log(true);
}

function loadSelectedCharacters(characters) {

    const tbody = $("#charactersSelected tbody");
    $(tbody).empty();
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/SuperheroSightings/getCharacters',
        success: function (data) {
            let count = 0;
            data.forEach((el, i) => {
                if (characters.includes(el.characterId)) {
                    count += 1;
                    tbody.append(`<tr>
                <td> ${count}. </td>
                <td>
                    <img src="${el.photo} alt="Char Pic" class="mugshot">
                </td>
                <td> ${el.name} </td>
                <td> ${el.isSuperHero ? "Hero" : "Villain"} </td>
                <td>
                    <a href=""> delete</a>
                </td>
            </tr>
                `
                    );
                }
            })
        },
        error: function () {
            console.log("There was an issue finding the data")
        }
    });
}


function getCharacterImages() {
    $.ajax({
        type: 'GET',
        data: null,
        url: 'http://localhost:8080/SuperheroSightings/getCharacters',
        success: function (data) {

            for (var i = 0; i < data.length; i++) {
                console.log(i, data[i].photo)
            }

        },
        error: function () {
            console.log("There was an issue finding the data")
        }
    });
}
 
function setResults(data) {
    $("#characterImg > img").attr("src", data[0].url);
    $("#uploadImage").val(data[0].url);
    $("#successfulAdd > span").html(`${data[0].original_filename} added!`);
    $("#successfulAdd").show();
}


