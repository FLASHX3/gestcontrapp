/*-------------------------------------------navbar----------------------------------------*/
document.addEventListener("DOMContentLoaded", onPageLoad);
var audio = document.querySelector("#notificationSound");

function onPageLoad() {
    var url = window.location.href;
    lien = url.slice(-6);
    lien = 'a[href="' + lien + '"]';
    activeLi(document.querySelector(lien).parentElement);
    // document.querySelector(lien).parentElement.click();
}

function activeIcon(icon) {
    var name = icon.getAttribute('name').split("-outline");
    var newName = name[0];
    icon.setAttribute('name', newName);
    return newName;
}

function desactiveIcon(icon) {
    var name = icon.getAttribute('name').split("-outline");
    var newName = name[0] + '-outline';
    icon.setAttribute('name', newName);
    return newName;
}

function desactiveLi() {
    var liste = document.getElementsByTagName('li');
    Array.from(liste).forEach(li => {
        li.classList.remove("actif");
        li.childNodes[0].classList.remove("on");
        desactiveIcon(li.querySelector('ion-icon'));
    });
}

function activeLi(li) {
    desactiveLi();
    li.classList.add("actif");
    lien = li.childNodes[0];  //le lien a correspondant
    lien.classList.add("on");
    activeIcon(li.querySelector('ion-icon'));
    checkliste.style.display = "none";
    document.querySelector('#customConfirm').style.display = "none";
}

function notification() {
    evolutionContrat = listemenu[2];
    // Créer l'élément span avec la classe "notif"
    var spanElement = document.createElement("span");
    spanElement.className = "spanNotif";

    // Créer l'élément ion-icon
    var ionIconElement = document.createElement("ion-icon");
    ionIconElement.setAttribute("name", "notifications-circle-outline");

    // Créer l'élément sup
    var supElement = document.createElement("sup");
    supElement.textContent = compte;

    // Ajouter l'élément ion-icon à span
    spanElement.appendChild(ionIconElement);

    // Ajouter l'élément sup à span
    spanElement.appendChild(supElement);

    // Récupérer le lien
    var linkElement = evolutionContrat.querySelector('a');

    // Récupérer le texte du lien
    var linkText = linkElement.innerHTML;

    // Ajouter le span à la suite du texte du lien
    linkElement.innerHTML = linkText + spanElement.outerHTML;

    // Lancer la lecture du son
    audio.play();
}

h1 = document.querySelector("nav h1");
h1.addEventListener('click', () => {
    window.location.reload();
    onPageLoad();
});

//liste du menu principal
const listemenu = document.querySelectorAll('nav ul li');

var date = new Date();  // objet Date représentant la date et l'heure actuelles
var compte = 0;     //nombre de contrat à surveiller

// Récupère la date d'aujourd'hui au format AAAA-MM-JJ
var annee = date.getFullYear();
var mois = (date.getMonth() + 1).toString().padStart(2, '0'); // Le mois commence à 0, donc on ajoute 1
var jour = date.getDate().toString().padStart(2, '0');

/*-------------------------------------------main1----------------------------------------*/
function surligne(champ, erreur) {
    champ.style.borderColor = erreur ? "red" : "";
}

function verifEntite(entite) {
    const erreurEntite = document.querySelector('#erreurEntite');
    if (entite.value == "") {
        surligne(entite, true);
        erreurEntite.innerHTML = "Veuillez choisir une entité valide!";
        return false;
    } else {
        surligne(entite, false);
        erreurEntite.innerHTML = "";
        return true;
    }
}

function verifNom(nom) {
    var regex = /^[a-zA-Zéèêâôï -]{0,25}$/;
    var erreurNom = document.querySelector('#erreurNom');

    if (nom.value == "") {
        surligne(nom, true);
        erreurNom.innerHTML = "Veuillez entrez un nom valide!";
        return false;
    }
    else {
        if (!regex.test(nom.value)) {
            surligne(nom, true);
            erreurNom.innerHTML = "nom invalide!";
            return false;
        }
        else {
            surligne(nom, false);
            erreurNom.innerHTML = "";
            return true;
        }
    }
}

function verifContact(contact) {
    var regex = /^(\+237)?[- ]?6([-. ]?[0-9]{2}){4}$/;
    const erreurContact = document.querySelector('#erreurContact');

    if (contact.value == "") {
        surligne(contact, true);
        erreurContact.innerHTML = "Veuillez entrez un numéro";
        return false;
    }
    else {
        if (!regex.test(contact.value)) {
            erreurContact.innerHTML = "Le numéro de téléphone est invalide!";
            surligne(contact, true);
            return true;
        }
        else {
            erreurContact.innerHTML = "";
            surligne(contact, false);
            return false;
        }
    }
}

function verifChampVide(champ, idChampErreur) {
    const champErreur = document.querySelector(idChampErreur);
    if (champ.value == "") {
        surligne(champ, true);
        champErreur.innerHTML = "Veuillez remplir ce champ";
        return false;
    } else {
        surligne(champ, false);
        champErreur.innerHTML = "";
        return true;
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const loyerInput = document.querySelector('#loy_mens');
    loyerInput.addEventListener('input', function () {
        const cautionInput = document.querySelector('#caution');
        const valeurLoyer = parseFloat(this.value);
        if (!isNaN(valeurLoyer)) {
            cautionInput.value = valeurLoyer * 2;
        } else {
            cautionInput.value = '';
        }
    });
});

// Récupérer les éléments de date de début et de fin
const dateDebut = document.querySelector('#date_start');
const dateFin = document.querySelector('#date_end');

// Ajouter un écouteur d'événements sur le champ de date de début
dateDebut.addEventListener('input', function () {
    // Récupérer la date sélectionnée dans le champ de date de début
    const dateDebutValue = new Date(this.value);
    // Mettre à jour la propriété min du champ de date de fin pour empêcher les dates antérieures
    dateFin.min = this.value;

    // Si une date a déjà été sélectionnée dans le champ de date de fin
    if (dateFin.value) {
        // Récupérer la date sélectionnée dans le champ de date de fin
        const dateFinValue = new Date(dateFin.value);
        // Si la date de fin est antérieure à la date de début, effacer la valeur du champ de date de fin
        if (dateFinValue < dateDebutValue) {
            dateFin.value = '';
        }
    }
});

function veriform(form) {
    var entiteOk = verifEntite(form.entite);
    var nomOk = verifNom(form.nom);
    var contactOk = verifContact(form.contact);
    var logementOk = verifChampVide(form.logement, '#erreurLogement');
    var dureeOk = verifChampVide(form.time_c, '#erreurDuree');
    var loyerOk = verifChampVide(form.loy_mens, '#erreurLoyer');
    var nbMoisOk = verifChampVide(form.nb_mois_paye, '#erreurNbMois');
    var cautionOk = verifChampVide(form.caution, '#erreurCaution');
    var penaliteOk = verifChampVide(form.erreurPenalite, '#erreurPenalite');
    var droitOk = verifChampVide(form.droit_reg, '#erreurEnregistrement');

    return (entiteOk && nomOk && contactOk && logementOk && dureeOk && loyerOk && nbMoisOk && nbMoisOk && cautionOk && penaliteOk && droitOk) ? true : false;
}

const prevBtns = document.querySelectorAll(".btn-prev");
const nextBtns = document.querySelectorAll(".btn-next");
const wrapperList = document.querySelector("#wrapper-list");
const progress = document.querySelector("#progress");
const progressSteps = document.querySelectorAll(".progress-step");

let translate = 0;
let formStepsNum = 0;

nextBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        translate -= 376;
        translate = (translate < -1504) ? -1504 : translate;
        wrapperList.style.transform = `translateX(${translate}px)`;
        formStepsNum++;
        updateProgressbar();
    });
});

prevBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        translate += 376;
        translate = (translate > 0) ? 0 : translate;
        wrapperList.style.transform = `translateX(${translate}px)`;
        formStepsNum--;
        updateProgressbar();
    });
});

function updateProgressbar() {
    progressSteps.forEach((progressStep, idx) => {
        if (idx < formStepsNum + 1) {
            progressStep.classList.add("progress-step-active");
        } else {
            progressStep.classList.remove("progress-step-active");
        }
    });

    const progressActive = document.querySelectorAll(".progress-step-active");

    progress.style.width =
        ((progressActive.length - 1) / (progressSteps.length - 1)) * 100 + "%";
}

/*-------------------------------------------main2----------------------------------------*/
attacherEcouteursEdition();
showContratSelect();
activeEtat();
gestionnaireFavori();
const buttonSearch = document.querySelector('#main2 #actionMain2 form [type="button"]');

searchMain2 = document.querySelector("#searchMain2");
searchMain2.addEventListener('input', (event) => {
    if (event.target.value.length > 0) {
        buttonSearch.style.display = "none";
    } else if (event.target.value == "") {
        buttonSearch.style.display = "block";
    }
})

const searchKeyword = async () => {
    document.querySelector('#synthese tbody').innerHTML = "";
    let keyword = document.querySelector('#searchMain2').value;
    if (keyword.length >= 2 || keyword.length == 0) {
        const req = await fetch(`search.php?searchMain2=${keyword}`);
        const json = await req.json();
        console.log(json);
        if (json.length > 0) {
            json.forEach((post) => {
                tr = document.createElement('tr');
                var compte = 0;

                for (var key in post) {
                    compte++;
                    td = document.createElement('td');

                    if (compte == 13) { // loyer mensuel
                        td.textContent = (post[key] * post['loyer_mensuel']).toLocaleString('fr-FR', { minimumFractionDigits: 0 });
                        tr.appendChild(td);
                    } else if (compte == 14 || compte == 19) {
                        td.textContent = post[key].toLocaleString('fr-FR', { minimumFractionDigits: 0 });
                        tr.appendChild(td);
                    } else if (compte == 22) {
                        td.classList.add(post[key]);
                        td.classList.add('ft-w');
                        td.setAttribute('data-idClient', post['id_operatoire']);
                        a = document.createElement('a');
                        a.href = "#main3";
                        var percent = 0;
                        var val_offre = (parseInt(post['validation_offre']) === 1 || parseInt(post['validation_offre']) === 0) ? 1 : 0;
                        var elab_contrat = (parseInt(post['elaboration_contrat']) === 1 || parseInt(post['elaboration_contrat']) === 0) ? 1 : 0;
                        var control_final = (parseInt(post['control_final']) === 1 || parseInt(post['control_final']) === 0) ? 1 : 0;
                        percent = parseInt(post['negoce']) + val_offre + parseInt(post['info_client']) + elab_contrat + parseInt(post['transmition_contrat_client']) + parseInt(post['finalisation_dossier']) + control_final + parseInt(post['validation_dossier']) + parseInt(post['transmition_contrat_remise']) + parseInt(post['transmition_decharge']) + parseInt(post['reception_dossier']) + parseInt(post['archivage']);
                        percent = parseFloat(percent * 100 / 12).toFixed(2);
                        h5 = document.createElement('h5');
                        h5.textContent = percent + '%';
                        span = document.createElement('span');
                        span.textContent = post[key];
                        div1 = document.createElement('div');
                        div1.classList.add('evolutionBar');
                        div2 = document.createElement('div');
                        div2.classList.add('evolution');
                        div2.style.width = percent + '%';
                        div1.appendChild(div2);
                        a.appendChild(h5);
                        a.appendChild(div1);
                        a.appendChild(span);
                        td.appendChild(a);
                        tr.appendChild(td);
                    } else if (compte == 23) {
                        td.classList.add('edition');
                        icon1 = document.createElement('ion-icon');
                        icon1.setAttribute('name', 'create-outline');
                        icon1.setAttribute('size', 'small');
                        icon1.setAttribute('title', 'Modifiez');
                        icon1.setAttribute('data-numDoc', 'numDoc' + post['id']);
                        form = document.createElement('form');
                        form.classList.add('favoris');
                        form.setAttribute('method', 'get');
                        button = document.createElement('button');
                        button.setAttribute('name', 'favori');
                        button.setAttribute('type', 'button');
                        button.setAttribute('value', post[key]);
                        icon2 = document.createElement('ion-icon');
                        icon2.setAttribute('size', 'small');
                        icon2.setAttribute('title', 'Marquez comme important');
                        if (post[key] == 0) { var name = "bookmark-outline"; } else { var name = "bookmark"; }
                        icon2.setAttribute('name', name);
                        inputHidden = document.createElement('input');
                        inputHidden.setAttribute('type', 'hidden');
                        inputHidden.setAttribute('name', 'id_operatoire');
                        inputHidden.setAttribute('value', post['id']);
                        button.appendChild(icon2);
                        form.appendChild(button);
                        form.appendChild(inputHidden);
                        icon3 = document.createElement('ion-icon');
                        icon3.setAttribute('name', 'trash-outline');
                        icon3.setAttribute('size', 'small');
                        icon3.setAttribute('title', 'supprimez');
                        td.appendChild(icon1);
                        td.appendChild(form);
                        td.appendChild(icon3);
                        tr.appendChild(td);
                        break;
                    } else {
                        td.textContent = post[key];
                        tr.appendChild(td);
                    }
                }
                document.querySelector('#synthese tbody').appendChild(tr);
            });
            showContratSelect();
            attacherEcouteursEdition();
            activeEtat();
            gestionnaireFavori();
        } else {        //aucun resultat correspndant
            document.querySelector("#synthese tbody").innerHTML = "";
            tr = document.createElement('tr');
            td = document.createElement('td');
            td.style.backgroundColor = "orange";
            td.style.color = "White";
            td.setAttribute('align', 'center');
            td.setAttribute('colspan', 23);
            td.textContent = 'Aucun résultat';
            tr.appendChild(td);
            document.querySelector("#synthese tbody").appendChild(tr);
        }
    }
}

const selectTrie = document.querySelector('#main2 #actionMain2 #tri');
const synthese = document.querySelector('#main2 #synthese');
const tbody = synthese.querySelector('tbody');

selectTrie.addEventListener('change', (event) => {
    selectValue = event.target.value;
    // Convertir les lignes du tableau en un tableau d'objets pour faciliter le tri
    const rows = Array.from(tbody.querySelectorAll('tr'));
    const rowData = rows.map(row => {
        const cellsData = Array.from(row.cells).map(cell => ({
            classes: Array.from(cell.classList),
            attributes: Array.from(cell.attributes),
            content: cell.innerHTML, // Ajout du contenu HTML de la cellule
        }));

        return {
            id: parseInt(row.cells[0].textContent),
            site: row.cells[1].textContent,
            entite: row.cells[2].textContent,
            ville: row.cells[3].textContent,
            natureBail: row.cells[4].textContent,
            nomLocataire: row.cells[5].textContent,
            contactClient: parseInt(row.cells[6].textContent),
            logement: row.cells[7].textContent,
            dureeContrat: parseInt(row.cells[8].textContent),
            loyerMensuel: parseInt(row.cells[9].textContent),
            frequencePaiement: row.cells[10].textContent,
            modePaiement: row.cells[11].textContent,
            montantLoyerPayer: parseInt(row.cells[12].textContent),
            montantCaution: parseInt(row.cells[13].textContent),
            revisionLoyer: row.cells[14].textContent,
            penaliteRetard: parseInt(row.cells[15].textContent),
            dateDebut: row.cells[16].textContent,
            dateFin: row.cells[17].textContent,
            droitEnregistrement: row.cells[18].textContent,
            nomGi: row.cells[19].textContent,
            numeroDossier: row.cells[20].innerHTML,
            etat: row.cells[21].innerHTML,
            edify: row.cells[22].innerHTML,
            cells: cellsData,
        };
    });

    // Trie selon le choix
    switch (selectValue) {
        case "id":
        case "dureeContrat":
        case "loyerMensuel":
        case "montantLoyerPayer":
        case "montantCaution":
        case "droitEnregistrement":
            rowData.sort((a, b) => a[selectValue] - b[selectValue]);
            break;
        case "site":
        case "entite":
        case "ville":
        case "natureBail":
        case "nomLocataire":
        case "logement":
        case "frequencePaiement":
        case "modePaiement":
        case "revisionLoyer":
        case "nomGi":
        case "numeroDossier":
            rowData.sort((a, b) => {
                const nomA = a[selectValue].toUpperCase(); // Convertir les noms en majuscules pour la comparaison
                const nomB = b[selectValue].toUpperCase();

                if (nomA < nomB) {
                    return -1; // Le nom de a vient avant le nom de b
                } else if (nomA > nomB) {
                    return 1; // Le nom de b vient avant le nom de a
                } else {
                    return 0; // Les noms sont identiques
                }
            });
            break;
        // case "dateDebut":
        // case "dateFin":
        //     donnee = selectValue;
        //     rowData.sort((a, b) => {
        //         const dateA = new Date(a[donnee]); // Convertir la date de la chaîne en objet Date
        //         const dateB = new Date(b[donnee]);
        //         return dateA - dateB; // Tri chronologique des dates
        //     });
        //     break;
        default:
            rowData.sort((a, b) => a.id - b.id);
            break;
    }

    // Remplacer les lignes du tableau d'origine par les lignes triées
    tbody.innerHTML = '';
    rowData.forEach(data => {
        const row = document.createElement('tr');
        data.cells.forEach(cell => {
            const td = document.createElement('td');
            cell.classes.forEach(className => td.classList.add(className));
            cell.attributes.forEach(attribute => td.setAttribute(attribute.nodeName, attribute.nodeValue));
            td.innerHTML = cell.content; // Ajout du contenu HTML
            row.appendChild(td);
        });
        tbody.appendChild(row);
    });
    attacherEcouteursEdition();
    showContratSelect();
    gestionnaireFavori();
});

function exportToExcel(tableId, filename) {
    var table = document.querySelector(tableId);
    var wb = XLSX.utils.table_to_book(table, { sheet: "Sheet1" });
    XLSX.writeFile(wb, filename + ".xlsx");
}

function exportToPDF(tableId, filename) {
    const table = document.querySelector(tableId);
    // Options pour html2pdf
    const options = {
        margin: 0.5,
        filename: filename,
        image: { type: 'jpeg', quality: 1 },
        html2canvas: { scale: 2 },
        jsPDF: {
            unit: 'in',
            format: [table.offsetWidth / 96, table.offsetHeight / 96], // Utilise la largeur et la hauteur du tableau pour définir la taille de la page
            orientation: 'landscape' // Changez l'orientation en paysage si nécessaire
        }
    };

    // Utilise html2pdf pour générer le PDF
    html2pdf().from(table).set(options).save();
}

function confirmExport() {
    document.querySelector('.custom-confirm').style.display = "flex";
}

document.querySelector('#excel').addEventListener('click', function () {
    exportToExcel("#synthese", "Recapitulatif");
    document.querySelector('.custom-confirm').style.display = "none";
});

document.querySelector('#pdf').addEventListener('click', function () {
    exportToPDF("#synthese", "Recapitulatif");
    document.querySelector('.custom-confirm').style.display = "none";
});

document.querySelector('.close').addEventListener('click', () => {
    document.querySelector('#customConfirm').style.display = "none";
});

document.querySelector('#synthese').addEventListener('click', () => {
    document.querySelector('#customConfirm').style.display = "none";
})

function showContratSelect() {
    const etats = document.querySelectorAll('.ft-w');
    etats.forEach((etat) => {
        etat.addEventListener('click', () => {
            activeLi(document.querySelector('a[href="#main3"]').parentElement);
            contratSelected = etat.getAttribute("data-idClient");
            contratSelected = "#contrat" + contratSelected;
            document.querySelector(contratSelected).click();
        })
    });
}

const evolutions = document.querySelectorAll('.evolution');
evolutions.forEach((evolution) => {
    if (evolution.style.width == "100%") {
        evolution.style.backgroundColor = "green";
    }
});


function activeEtat() {
    var actifs = document.querySelectorAll('.Actif a');
    actifs.forEach(function (element) {
        var icon = document.createElement('ion-icon');
        icon.setAttribute('name', 'checkmark-circle');
        icon.setAttribute('size', 'small');
        icon.style.position = 'relative';
        icon.style.top = '5px';
        icon.style.left = 0;
        element.appendChild(icon);
    });

    var encours = document.querySelectorAll('.En-cours a');
    encours.forEach(function (element) {
        var icon = document.createElement('ion-icon');
        icon.setAttribute('name', 'ellipsis-horizontal-outline');
        icon.setAttribute('size', 'small');
        icon.style.position = 'relative';
        icon.style.top = '5px';
        icon.style.left = 0;
        element.appendChild(icon);
    });

    var resilies = document.querySelectorAll('.Résilié a');
    resilies.forEach(function (element) {
        var icon = document.createElement('ion-icon');
        icon.setAttribute('name', 'close');
        icon.style.position = 'relative';
        icon.style.top = '5px';
        icon.style.left = '5px';
        element.appendChild(icon);
    })
}

//boutons d'édition (pencil, favoris, supprimer)
function attacherEcouteursEdition() {
    var etatIcon = false;
    const edits = document.querySelectorAll('#main2 td.edition ion-icon[name="create-outline"], #main2 td.edition ion-icon[name="create"]');
    edits.forEach((edit) => {
        edit.addEventListener('click', () => {
            etatIcon = (etatIcon) ? false : true;
            if (etatIcon) {
                newNameIcone = activeIcon(edit);
                if (newNameIcone == "create") {
                    var val_num_doc = edit.getAttribute('data-numDoc');
                    val_num_doc = "#" + val_num_doc;
                    document.querySelector(val_num_doc).disabled = false;
                    document.querySelector(val_num_doc).focus();
                }
            } else {
                newNameIcone = desactiveIcon(edit);
                if (newNameIcone == "create-outline") {
                    var val_num_doc = edit.getAttribute('data-numDoc');
                    val_num_doc = "#" + val_num_doc;
                    document.querySelector(val_num_doc).disabled = true;
                    document.querySelector(val_num_doc).blur();
                }
            }
        });
    });
}

function gestionnaireFavori() {
    const favoris = document.querySelectorAll('[name="favori"]');
    favoris.forEach(async function (button) {
        button.addEventListener('click', async function () {
            var id = this.getAttribute('data-id');
            var valeur = this.value;
            try {
                const req = await fetch(`favori.php?favori=${valeur}&id=${id}`);
                const json = await req.json();

                this.value = json[0].favori;

                if (this.value == 0) {
                    // Changement d'icône pour "bookmark-outline"
                    desactiveIcon(this.querySelector('ion-icon'));
                } else {
                    // Changement d'icône pour "bookmark"
                    activeIcon(this.querySelector('ion-icon'));
                }
            } catch (error) {
                console.log('Erreur lors de la mise à jour : ' + error.message);
            }
        });
    });
}

/*-------------------------------------------main3----------------------------------------*/
const iconSearch = document.querySelector('#main3 #form_search [name="search-outline"]');

searchMain3 = document.querySelector("#search");
searchMain3.addEventListener('input', (event) => {
    if (event.target.value.length > 0) {
        iconSearch.style.display = "none";
    } else if (event.target.value == "") {
        iconSearch.style.display = "block";
    }
})

const contrats = document.querySelectorAll(".contrat"); //liste des contrats
const checkliste = document.querySelector("#checkliste"); //checkliste
const modify = document.querySelector('[name="pencil"]'); //bouton modifiier checkliste
const closer = document.querySelector(".croix"); //bouton fermeture checklise
const formElements = document.querySelectorAll('input[type="checkbox"], input[type="radio"]');
const submitButton = document.querySelector('#main3 button[type="submit"]');
let modified;

//recuperation des champs d'entête
const dateAjout = document.querySelector("#dateAjout");
const logement = document.querySelector("#numEspace");
const nomClient = document.querySelector("#nomClient");
const numContrat = document.querySelector("#numContrat");
const nomGI = document.querySelector("#nomGI");
const nomSite = document.querySelector("#nomSite");

//inputs du formulaire de la checkliste
const negoce = document.querySelector("#main3 #negoce");
const val_off = document.querySelectorAll('#main3 input[type="radio"][name="val_off"]');
const info_client = document.querySelector("#main3 #info_client");
const elab_contrat = document.querySelectorAll('#main3 input[type="radio"][name="elab_contrat"]');
const trans_contrat = document.querySelector("#main3 #trans_contrat");
const final_dossier = document.querySelector("#main3 #final_dossier");
const control_final = document.querySelectorAll('#main3 input[type="radio"][name="control_final"]');
const val_doss = document.querySelector("#main3 #val_doss");
const trans_contrat_remise = document.querySelector("#main3 #trans_contrat_remise");
const trans_decharge = document.querySelector("#main3 #trans_decharge");
const recept_doc = document.querySelector("#main3 #recept_doc");
const archivage = document.querySelector("#main3 #archivage");
const input_hidden = document.querySelector('#main3 [name="id_operatoire"]');

function differenceEnJours(date1, date2) {
    var differenceEnMillisecondes = date1 - date2;
    var differenceEnJours = differenceEnMillisecondes / (1000 * 3600 * 24);
    return differenceEnJours;
}

// Fonction pour normaliser une date (fixe les heures, minutes, secondes et millisecondes à 0)
function normaliserDate(date) {
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);
    date.setMilliseconds(0);
    return date;
}

// Fonction pour comparer le jour, le mois et l'année de deux dates
function comparerJourMoisAnnee(date1, date2) {
    return date1.getDate() === date2.getDate() &&
        date1.getMonth() === date2.getMonth() &&
        date1.getFullYear() === date2.getFullYear();
}

function substringDate(parts) {
    var parts = parts.split("-");
    var jour = parseInt(parts[2], 10); // parseInt pour convertir en nombre entier
    var mois = parseInt(parts[1], 10) - 1; // Mois commence à 0, donc on soustrait 1
    var annee = parseInt(parts[0], 10);
    return new Date(annee, mois, jour);
}

//affichage checkliste
contrats.forEach((contrat) => {
    var date_fin_string = contrat.getAttribute("data-date_fin");
    // Divisez la chaîne en parties pour extraire le jour, le mois et l'année
    var date_fin = substringDate(date_fin_string);
    // Normalisez les deux dates
    date = normaliserDate(date);
    date_fin = normaliserDate(date_fin);

    if (comparerJourMoisAnnee(date, date_fin)) {    //La date d'expiration est aujourd'hui
        contrat.style.backgroundColor = "rgba(255, 165, 0, 0.5)";       //orange
        contrat.style.animation = 'pulse 0.5s linear infinite';
        compte++;
    } else if (date < date_fin) {
        var difference = differenceEnJours(date_fin, date);
        if (difference > 7) {       // date d'expiration encore loin

        } else {        // Date d'expiration en approche (-7jours)
            contrat.style.backgroundColor = "rgba(0, 128, 0, 0.5)";     //green
            contrat.style.animation = 'pulse 0.5s linear infinite';
            compte++;
        }
    } else if (date > date_fin) {       // Date d'expiration passée
        contrat.style.backgroundColor = "rgba(255, 0, 0, 0.5)";     //red
        contrat.style.animation = 'pulse 0.5s linear infinite';
        compte++;
    }

    contrat.addEventListener("click", () => {
        const inputs = document.querySelectorAll("#checkliste #table2 input");
        checkliste.style.display = "block";
        inputs.forEach((input) => {
            input.disabled = true;
        });
        submitButton.style.display = "none";
        submitButton.style.disabled = true;
        modified = false;

        //recuperation des valeurs de l'entête
        const val_dateAjout = contrat.getAttribute("data-date_ajout");
        const val_logement = contrat.getAttribute("data-logement");
        const val_nomClient = contrat.getAttribute("data-nom_client");
        const val_site = contrat.getAttribute("data-site");
        const val_nomGi = contrat.getAttribute("data-nom_Gi");
        const val_num_dossier = contrat.getAttribute("data-num_dossier");

        //Mise à jours de l'entête
        dateAjout.textContent = "Date : " + val_dateAjout;
        logement.textContent = val_logement;
        nomClient.textContent = "Nom client : " + val_nomClient;
        numContrat.textContent = val_num_dossier;
        nomGI.textContent = "Nom gestionnaire : " + val_nomGi;
        nomSite.textContent = val_site;

        //recuperation des valeurs des inputs
        const val_negoce = contrat.getAttribute("data-negoce");
        const choix = JSON.parse(contrat.dataset.choix);        //val_offre,elab_offre,control_final
        const val_info_client = contrat.getAttribute("data-info_client");
        const val_transmition_contrat_client = contrat.getAttribute("data-transmition_contrat_client");
        const val_finalisation_dossier = contrat.getAttribute("data-finalisation_dossier");
        const val_validation_dossier = contrat.getAttribute("data-validation_dossier");
        const val_trans_contrat_remise = contrat.getAttribute("data-trans_contrat_remise");
        const val_transmition_decharge = contrat.getAttribute("data-transmition_decharge");
        const val_reception_dossier = contrat.getAttribute("data-reception_dossier");
        const val_archivage = contrat.getAttribute("data-archivage");
        const val_input_hidden = contrat.getAttribute("data-id_operatoire");

        //mise à jours des inputs
        negoce.checked = (val_negoce == 1) ? true : false;
        val_off[0].checked = (choix["val_offre"] === 1) ? 1 : (choix["val_offre"] === null) ? false : 0;
        val_off[1].checked = (choix["val_offre"] === 0) ? 1 : (choix["val_offre"] === null) ? false : 0;
        info_client.checked = (val_info_client == 1) ? true : false;
        elab_contrat[0].checked = (choix["elab_contrat"] === 1) ? 1 : (choix["elab_contrat"] === null) ? false : 0;
        elab_contrat[1].checked = (choix["elab_contrat"] === 0) ? 1 : (choix["elab_contrat"] === null) ? false : 0;
        trans_contrat.checked = (val_transmition_contrat_client == 1) ? true : false;
        final_dossier.checked = (val_finalisation_dossier == 1) ? true : false;
        control_final[0].checked = (choix["control_final"] === 1) ? 1 : (choix["control_final"] === null) ? false : 0;
        control_final[1].checked = (choix["control_final"] === 0) ? 1 : (choix["control_final"] === null) ? false : 0;
        val_doss.checked = (val_validation_dossier == 1) ? true : false;
        trans_contrat_remise.checked = (val_trans_contrat_remise == 1) ? true : false;
        trans_decharge.checked = (val_transmition_decharge == 1) ? true : false;
        recept_doc.checked = (val_reception_dossier == 1) ? true : false;
        archivage.checked = (val_archivage == 1) ? true : false;
        input_hidden.setAttribute("value", val_input_hidden);

        formElements.forEach(element => {
            element.addEventListener('change', () => {
                modified = true;
                submitButton.style.display = "flex";
                submitButton.style.disabled = false;
            });
        });
    });
});

compte > 0 ? notification() : null;
if (compte > 0) {
    // Fonction pour rejouer le son
    function replaySound() {
        audio.currentTime = 0; // Réinitialiser la lecture au début
        audio.play(); // Jouer le son à nouveau
    }

    // Ajouter un événement 'timeupdate' pour détecter le milieu de la lecture
    audio.addEventListener("timeupdate", function () {
        // Vérifier si le temps de lecture est à la moitié
        if (audio.currentTime >= audio.duration / 4) {
            replaySound(); // Appeler la fonction pour rejouer le son
        }
    });

    var spanNotif = document.querySelector(".spanNotif");
    iconNotif = spanNotif.querySelector('ion-icon');
    etatIcon = true;

    // Ajouter un événement de clic à l'élément avec la classe spanNotif
    spanNotif.addEventListener("click", function () {
        etatIcon = etatIcon ? false : true;
        if (!etatIcon) {
            iconNotif.setAttribute('name', "notifications-off-circle-outline");
            audio.pause(); // Mettre en pause la lecture du son
        } else {
            iconNotif.setAttribute('name', "notifications-circle-outline");
            audio.play(); // Mettre sur play la lecture du son
        }
    });
}

//activation de la modification de la checkliste
modify.addEventListener("click", () => {
    const inputs = document.querySelectorAll("#checkliste #table2 input");
    inputs.forEach((input) => {
        input.disabled = (input.disabled) ? false : true;
    });
});

closer.addEventListener("click", () => {
    if (modified === false) { checkliste.style.display = "none"; }
    else {
        alert("Veuillez enregistrez les modifications!");
        checkliste.scrollIntoView({ behavior: 'smooth', block: 'end' });
    }
});