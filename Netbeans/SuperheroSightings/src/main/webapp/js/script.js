(document).ready(function () {
    $.ajax({
        type: 'GET',
        url: 'https://api.imgur.com/3/image/w0S7um9',
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
    loadEndpointsForSightings();
    loadPills();
    var organizationSave = $("#saveOrganizations");
    organizationSave.click(function () {
        loadPills();
    });
    $(".clickable-row").click(function () {
        window.location = $(this).data("href");
    });
});
function removeChecks(pill) {
    var allOrganizations = $(".organizationSelection");
    allOrganizations.each((index, element) => {
        if ($(element)[0].value === pill.dataset.type) {
            $(element)[0].checked = false;
        }
    });
    loadPills();
}
function loadPills() {
    var organizationDisplay = $("#myOrganizations");
    var allOrganizations = $(".organizationSelection");
    organizationDisplay.empty();
    allOrganizations.each((index, element) => {
        if ($(element)[0].checked) {
            console.log($(element)[0].dataset.name)
            organizationDisplay.append(preparePill($(element)[0]));
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
function preparePill(data) {
    return `</div>
            <div class="col-md-5 pill">
            <div class="closePill" onclick="removePill(this)" data-type="${data.value}">
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
        }
        else {
            fileName = e.target.value.split('\\').pop();
        }
        if (fileName) {
            label.querySelector('span').innerHTML = "true nuh";
            label.querySelector('span').innerHTML = fileName; }
        else {
            label.innerHTML = labelVal;
        }
    });
});
function uploadImages() {
    var imagesToUpload = $("#imagesToUpload");
    console.log(imagesToUpload[0].files);
}