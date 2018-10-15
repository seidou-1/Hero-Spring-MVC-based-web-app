
$(document).ready(function () {

    $(".locationSortModal").on('shown.bs.modal', () => {
        $('#locationSubmit').click(() => {
            $(".locationIn:checked").each((index, element) => {
                $("#hiddenLocation").val($(element).val());
            });
        });
    });

    $(".characterSortModal").on('shown.bs.modal', () => {
        $('#characterSubmit').click(() => {
            var characters = "";
            arrOfCharacters = [];
            $(".charactersSelect:checked").each((index, element) => {
                characters += $(element).val() + "_";
                arrOfCharacters.push(+$(element).val());

            });


            $("#hiddenCharacters").val(characters);


        });
    });

    var arrOfCharacters = [];

    $(".characterSortModal").on('hide.bs.modal', () => {
        loadSelectedCharacters(arrOfCharacters);




        if (arrOfCharacters.length > 0) {
            console.log("heyy")

            $("#charactersHead i").addClass("passed");

        } else {

            $("#charactersHead i").removeClass("passed");
        }
    });

});


function setLocation() {

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
                    <a data-id="${el.characterId}" href="#" class="deleteCharacter"> delete</a>
                </td>
            </tr>
                `
                    );
                }
            })


            const loaded = $(".deleteCharacter");

            loaded.each((i, el) => {
                $(el).click(() => {
                    console.log(el.dataset.id)
                });
            });

        },
        error: function () {
            console.log("There was an issue finding the data")
        }
    });
}


