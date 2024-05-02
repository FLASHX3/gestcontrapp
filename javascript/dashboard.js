/*-------------------------------------------navbar----------------------------------------*/
document.addEventListener("DOMContentLoaded", onPageLoad);
var audio = document.querySelector("#notificationSound");

function onPageLoad() {
    var url = window.location.href;
    lien = url.slice(-6);
    lien = 'a[href="' + lien + '"]';
    // activeLi(document.querySelector(lien).parentElement);
    document.querySelector(lien).parentElement.click();
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
    var liste = document.querySelectorAll('nav li');
    Array.from(liste).forEach(li => {
        li.classList.remove("actif");
        li.childNodes[0].classList.remove("on");
        desactiveIcon(li.querySelector('ion-icon'));
    });
}

function activeLi(li) {
    desactiveLi();
    li.classList.add("actif");
    lien = li.childNodes[0];  //le lien "<a/>" correspondant
    lien.classList.add("on");
    console.log("Menu: " + lien.textContent);
    activeIcon(li.querySelector('ion-icon'));
    document.querySelector('#checkliste').style.display = "none";
    document.querySelector('#customConfirm').style.display = "none";
}

function notification() {
    evolutionContrat = listemenu[2];

    // Récupérer le lien
    var linkElement = evolutionContrat.querySelector('a');

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

    // Récupérer le texte du lien
    var linkText = linkElement.innerHTML;

    // Ajouter le span à la suite du texte du lien
    linkElement.innerHTML = linkText + spanElement.outerHTML;

    // Lancer la lecture du son
    // audio.play();
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

function verifEntite(entite, idChampErreur) {
    const champErreur = document.querySelector(idChampErreur);
    if (entite.value == "") {
        surligne(entite, true);
        champErreur.innerHTML = "Veuillez choisir une entité valide!";
        return false;
    } else {
        surligne(entite, false);
        champErreur.innerHTML = "";
        return true;
    }
}

function verifNom(nom, idChampErreur) {
    var regex = /^[a-zA-Zéèêâôï -]{0,25}$/;
    const champErreur = document.querySelector(idChampErreur);

    if (nom.value == "") {
        surligne(nom, true);
        champErreur.innerHTML = "Veuillez entrez un nom valide!";
        return false;
    }
    else {
        if (!regex.test(nom.value)) {
            surligne(nom, true);
            champErreur.innerHTML = "nom invalide!";
            return false;
        }
        else {
            surligne(nom, false);
            champErreur.innerHTML = "";
            return true;
        }
    }
}

function verifContact(contact, idChampErreur) {
    var regex = /^(\+237)?[- ]?6([-. ]?[0-9]{2}){4}$/;
    const champErreur = document.querySelector(idChampErreur);

    if (contact.value == "") {
        surligne(contact, true);
        champErreur.innerHTML = "Veuillez entrez un numéro";
        return false;
    }
    else {
        if (!regex.test(contact.value)) {
            champErreur.innerHTML = "Le numéro de téléphone est invalide!";
            surligne(contact, true);
            return true;
        }
        else {
            champErreur.innerHTML = "";
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
    var entiteOk = verifEntite(form.entite, "#" + form.querySelector('[id^="erreurEntite"] span').id);
    var nomOk = verifNom(form.nom, "#" + form.querySelector('[id^="erreurNom"] span').id);
    var contactOk = verifContact(form.contact, "#" + form.querySelector('[id^="erreurContact"] span').id);
    var logementOk = verifChampVide(form.logement, "#" + form.querySelector('[id^="erreurLogement"] span').id);
    var dureeOk = verifChampVide(form.time_c, "#" + form.querySelector('[id^="erreurDuree"] span').id);
    var loyerOk = verifChampVide(form.loy_mens, "#" + form.querySelector('[id^="erreurLoyer"] span').id);
    var nbMoisOk = verifChampVide(form.nb_mois_paye, "#" + form.querySelector('[id^="erreurNbMois"] span').id);
    var cautionOk = verifChampVide(form.caution, "#" + form.querySelector('[id^="erreurCaution"] span').id);
    var penaliteOk = verifChampVide(form.erreurPenalite, "#" + form.querySelector('[id^="erreurPenalite"] span').id);
    var droitOk = verifChampVide(form.droit_reg, "#" + form.querySelector('[id^="erreurSave"] span').id);

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
const buttonSearch = document.querySelector('#main2 #actionMain2 form [name="search-outline"]');

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
        if (json.length > 0) {
            json.forEach((post) => {
                tr = document.createElement('tr');
                td = document.createElement('td');
                td.textContent = post['id'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['site'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['entite'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['ville'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['nature_bail'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['nom_locataire'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['contact'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['logement'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['duree_contrat'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['loyer_mensuel'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['frequence_paiement'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['mode_paiement'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['nombre_mois'] * post['loyer_mensuel'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['montant_caution'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['revision_loyer'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['pénalites_retard'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['date_debut_contrat'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['date_fin_contrat'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['date_ajout'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['droit_enregistrement'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['nom_GI'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.textContent = post['numero_dossier'];
                tr.appendChild(td);
                td = document.createElement('td');
                td.classList.add(post['etat']);
                td.classList.add('ft-w');
                td.setAttribute('data-idClient', post['id_operatoire']);
                a = document.createElement('a');
                a.href = "#main3";
                var percent = 0;
                if (post['etat'] == "En-cours" || post['etat'] == "Actif") {
                    var val_offre = (parseInt(post['validation_offre']) === 1 || parseInt(post['validation_offre']) === 0) ? 1 : 0;
                    var elab_contrat = (parseInt(post['elaboration_contrat']) === 1 || parseInt(post['elaboration_contrat']) === 0) ? 1 : 0;
                    var control_final = (parseInt(post['control_final']) === 1 || parseInt(post['control_final']) === 0) ? 1 : 0;
                    percent = parseInt(post['negoce']) + val_offre + parseInt(post['info_client']) + elab_contrat + parseInt(post['transmition_contrat_client']) + parseInt(post['finalisation_dossier']) + control_final + parseInt(post['validation_dossier']) + parseInt(post['transmition_contrat_remise']) + parseInt(post['transmition_decharge']) + parseInt(post['reception_dossier']) + parseInt(post['archivage']);
                } else {
                    var control_val = (parseInt(post['controle_validation_dossier']) === 1 || parseInt(post['controle_validation_dossier']) === 0) ? 1 : 0;
                    percent = parseInt(post['lettre_preavis']) + control_val + parseInt(post['transmition_elements']) + parseInt(post['prevalidation_dossier']) + parseInt(post['validation_provisoire']) + parseInt(post['transmition_element_provisoire']) + parseInt(post['transmition_reponse']) + parseInt(post['etat_lieux']) + parseInt(post['transmition_elements_complet']) + parseInt(post['approbation_dossier']) + parseInt(post['paiement_locataire']) + parseInt(post['archivage_resiliation']);
                }
                percent = parseFloat(percent * 100 / 12).toFixed(2);
                h5 = document.createElement('h5');
                h5.textContent = percent + '%';
                span = document.createElement('span');
                span.textContent = post['etat'];
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
                td = document.createElement('td');
                td.classList.add('edition');
                icon1 = document.createElement('ion-icon');
                icon1.setAttribute('name', 'create-outline');
                icon1.setAttribute('size', 'small');
                icon1.setAttribute('title', 'Modifiez');
                icon1.setAttribute('data-numDoc', 'numDoc' + post['id']);
                icon1.setAttribute('data-etat', 'false');
                form = document.createElement('form');
                form.classList.add('favoris');
                form.setAttribute('method', 'get');
                form.setAttribute('action', '');
                button = document.createElement('button');
                button.setAttribute('type', 'button');
                button.setAttribute('name', 'favori');
                button.setAttribute('data-id', post['id']);
                button.setAttribute('value', post['favori']);
                icon2 = document.createElement('ion-icon');
                icon2.setAttribute('size', 'small');
                icon2.setAttribute('title', 'Marquez comme important');
                var name = (post['favori'] == 0) ? "bookmark-outline" : "bookmark";
                icon2.setAttribute('name', name);
                button.appendChild(icon2);
                form.appendChild(button);
                icon3 = document.createElement('ion-icon');
                icon3.setAttribute('name', 'trash-outline');
                icon3.setAttribute('size', 'small');
                icon3.setAttribute('title', 'supprimez');
                td.appendChild(icon1);
                td.appendChild(form);
                td.appendChild(icon3);
                tr.appendChild(td);
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
            td.style.color = "white";
            td.setAttribute('align', 'center');
            td.setAttribute('colspan', 24);
            td.textContent = 'Aucun résultat';
            tr.appendChild(td);
            document.querySelector("#synthese tbody").appendChild(tr);
        }
    }
}

const selectTrie = document.querySelector('#main2 #actionMain2 #tri');

selectTrie.addEventListener('change', (event) => {
    const synthese = document.querySelector('#main2 #synthese');
    const tbody = synthese.querySelector('tbody');
    var selectValue = event.target.value;
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
            dateAjout: cell[18].textContent,
            droitEnregistrement: row.cells[19].textContent,
            nomGi: row.cells[20].textContent,
            numeroDossier: row.cells[21].textContent,
            etat: row.cells[22].innerHTML,
            edify: row.cells[23].innerHTML,
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
        case "etat":
            rowData.sort((a, b) => a[selectValue] - b[selectValue]);
            console.log("Tri par " + selectValue + " choisie");
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
            console.log("tri par " + selectValue + " choisie");
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
            rowData.sort((a, b) => a[id] - b[id]);
            console.log("Tri par défaut sur " + selectValue);
            break;
    }

    // Remplacer les lignes du tableau d'origine par les lignes triées
    tbody.innerHTML = "";
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
        exit;
    });
    attacherEcouteursEdition();
    showContratSelect();
    activeEtat();
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

function activeEtat() {
    var actifs = document.querySelectorAll('.Actif a');
    actifs.forEach(function (element) {
        evolution = element.querySelector('.evolution');
        evolution.style.backgroundColor = "green";
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

    var en_resilieation = document.querySelectorAll('.En-Résiliation a');
    en_resilieation.forEach(function (element) {
        evolution = element.querySelector('.evolution');
        evolution.style.backgroundColor = "black";
        // var icon = document.createElement('ion-icon');
        // icon.setAttribute('name', 'close');
        // icon.style.position = 'relative';
        // icon.style.top = '5px';
        // icon.style.left = '5px';
        // element.appendChild(icon);
    });

    var resilies = document.querySelectorAll('.Résilié a');
    resilies.forEach(function (element) {
        evolution = element.querySelector('.evolution');
        evolution.style.backgroundColor = "red";
        var icon = document.createElement('ion-icon');
        icon.setAttribute('name', 'remove-circle');
        icon.setAttribute('size', 'small');
        icon.style.position = 'relative';
        icon.style.top = '5px';
        icon.style.left = '5px';
        element.appendChild(icon);
    });
}

// Récupérer les éléments de date de début et de fin
const dateDebutM = document.querySelector('#debutM');
const dateFinM = document.querySelector('#finM');

// Ajouter un écouteur d'événements sur le champ de date de début
dateDebutM.addEventListener('input', function () {
    // Récupérer la date sélectionnée dans le champ de date de début
    const dateDebutValue = new Date(this.value);
    // Mettre à jour la propriété min du champ de date de fin pour empêcher les dates antérieures
    dateFinM.min = this.value;

    // Si une date a déjà été sélectionnée dans le champ de date de fin
    if (dateFinM.value) {
        // Récupérer la date sélectionnée dans le champ de date de fin
        const dateFinValue = new Date(dateFinM.value);
        // Si la date de fin est antérieure à la date de début, effacer la valeur du champ de date de fin
        if (dateFinValue < dateDebutValue) {
            dateFinM.value = '';
        }
    }
});

//boutons d'édition (pencil)
function attacherEcouteursEdition() {
    var idDoc = "";
    var etatIcon;
    var modification = document.querySelector('#modification');
    const edits = document.querySelectorAll('#main2 td.edition ion-icon[name="create-outline"], #main2 td.edition ion-icon[name="create"]');
    edits.forEach((edit) => {
        edit.addEventListener('click', async () => {
            var val_num_doc = edit.getAttribute('data-numDoc');
            etatIcon = edit.getAttribute('data-etat');
            if (etatIcon == "false") {
                if (idDoc == val_num_doc || idDoc == "") {
                    var rect = edit.getBoundingClientRect();
                    modification.style.position = 'absolute';
                    modification.style.left = rect.left + 'px';
                    modification.style.top = rect.bottom + 'px';

                    activeIcon(edit);
                    modification.style.display = "block";
                    edit.setAttribute('data-etat', 'true');
                    idDoc = val_num_doc;
                    var chiffre = val_num_doc.match(/\d+$/);
                    if (chiffre) {
                        var numero = parseInt(chiffre[0]);
                        document.querySelector('#idM').value = numero;
                    }
                    try {
                        const req = await fetch(`getDonnee.php?id=${numero}`);
                        const json = await req.json();
                        console.log("Nom GI à modifier " + json[0].nom_GI);

                        document.querySelector('#siteM').value = json[0].site;
                        document.querySelector('#entiteM').value = json[0].entite;
                        document.querySelector('#villeM').value = json[0].ville;
                        document.querySelector('#natureBailM').value = json[0].nature_bail;
                        document.querySelector('#nomM').value = json[0].nom_locataire;
                        document.querySelector('#contactM').value = json[0].contact;
                        document.querySelector('#logementM').value = json[0].logement;
                        document.querySelector('#timeM').value = json[0].duree_contrat;
                        document.querySelector('#loyerM').value = json[0].loyer_mensuel;
                        document.querySelector('#frequenceM').value = json[0].frequence_paiement;
                        document.querySelector('#modePaiementM').value = json[0].mode_paiement;
                        document.querySelector('#nombreMoisM').value = json[0].nombre_mois;
                        document.querySelector('#montantCautionM').value = json[0].montant_caution;
                        document.querySelector('#revisionM').value = json[0].revision_loyer;
                        document.querySelector('#penaliteM').value = json[0].pénalites_retard;
                        document.querySelector('#debutM').value = json[0].date_debut_contrat;
                        document.querySelector('#finM').value = json[0].date_fin_contrat;
                        document.querySelector('#saveM').value = json[0].droit_enregistrement;
                        document.querySelector('#giM').value = json[0].nom_GI;
                        document.querySelector('#numDocM').value = json[0].numero_dossier;
                    } catch (error) {
                        console.log("Erreur de recuperation de donnée! " + error.message);
                    }
                }
            } else if (etatIcon == "true") {
                if (idDoc == val_num_doc) {
                    modification.style.display = "none";
                    desactiveIcon(edit);
                    edit.setAttribute('data-etat', 'false');
                    idDoc = "";
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

                newValue = (json[0].favori == 0) ? 1 : 0;
                console.log("newValue Favori = " + newValue);
                document.querySelector(`.edition form button[data-id="${id}"]`).value = newValue;

                if (newValue == 1) {
                    desactiveIcon(this.querySelector('ion-icon'));
                } else {
                    activeIcon(this.querySelector('ion-icon'));
                }
            } catch (error) {
                console.log('Erreur lors de la mise à jour des favoris : ' + error.message);
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
});

const allContrats = document.querySelector('#allContrats');
const dataContrat = JSON.parse(allContrats.getAttribute('data-resultat'));
console.log("Tous les contrats en-cours: " + dataContrat.length);

function showContrat(defaultSelected = "Douala") {
    document.querySelector('#table').innerHTML = "";
    if (dataContrat.length >= 0) {
        dataContrat.forEach((post) => {
            if (post['ville'] == defaultSelected) {
                var percent = 0;
                var val_offre = (parseInt(post['validation_offre']) === 1 || parseInt(post['validation_offre']) === 0) ? 1 : 0;
                var elab_contrat = (parseInt(post['elaboration_contrat']) === 1 || parseInt(post['elaboration_contrat']) === 0) ? 1 : 0;
                var control_final = (parseInt(post['control_final']) === 1 || parseInt(post['control_final']) === 0) ? 1 : 0;
                var choix = { "val_offre": post['validation_offre'], "elab_contrat": post['elaboration_contrat'], "control_final": post['control_final'] };
                percent = parseInt(post['negoce']) + val_offre + parseInt(post['info_client']) + elab_contrat + parseInt(post['transmition_contrat_client']) + parseInt(post['finalisation_dossier']) + control_final + parseInt(post['validation_dossier']) + parseInt(post['transmition_contrat_remise']) + parseInt(post['transmition_decharge']) + parseInt(post['reception_dossier']) + parseInt(post['archivage']);
                percent = parseFloat(percent * 100 / 12).toFixed(2);
                var divContrat = document.createElement('div');
                divContrat.setAttribute('class', 'contrat');
                divContrat.setAttribute('id', 'contrat' + parseInt(post['id_operatoire']));
                divContrat.setAttribute('title', 'date fin : ' + post['date_fin_contrat']);
                divContrat.setAttribute('data-num_dossier', post['numero_dossier']);
                divContrat.setAttribute('data-choix', JSON.stringify(choix));
                divContrat.setAttribute('data-id_operatoire', parseInt(post['id_operatoire']));
                divContrat.setAttribute('data-logement', post['logement']);
                divContrat.setAttribute('data-date_ajout', post['date_ajout']);
                divContrat.setAttribute('data-date_fin', post['date_fin_contrat']);
                divContrat.setAttribute('data-nom_client', post['nom_locataire']);
                divContrat.setAttribute('data-site', post['site']);
                divContrat.setAttribute('data-nom_Gi', post['nom_GI']);
                divContrat.setAttribute('data-negoce', parseInt(post['negoce']));
                divContrat.setAttribute('data-validation_offre', parseInt(post['validation_offre']));
                divContrat.setAttribute('data-info_client', parseInt(post['info_client']));
                divContrat.setAttribute('data-elaboration_contrat', parseInt(post['elaboration_contrat']));
                divContrat.setAttribute('data-transmition_contrat_client', parseInt(post['transmition_contrat_client']));
                divContrat.setAttribute('data-finalisation_dossier', parseInt(post['finalisation_dossier']));
                divContrat.setAttribute('data-control_final', parseInt(post['control_final']));
                divContrat.setAttribute('data-validation_dossier', parseInt(post['validation_dossier']));
                divContrat.setAttribute('data-trans_contrat_remise', parseInt(post['transmition_contrat_remise']));
                divContrat.setAttribute('data-transmition_decharge', parseInt(post['transmition_decharge']));
                divContrat.setAttribute('data-reception_dossier', parseInt(post['reception_dossier']));
                divContrat.setAttribute('data-archivage', parseInt(post['archivage']));
                divContrat.setAttribute('onclick', "activeCheckliste()");

                if (percent == 100) {       //Contrats actifs
                    var divEndcontrat = document.createElement('div');
                    divEndcontrat.classList.add('end_contrat');
                    icnonJuste = document.createElement('ion-icon');
                    icnonJuste.setAttribute('name', 'checkmark-circle-outline');
                    icnonJuste.setAttribute('size', 'small');
                    icnonResilie = document.createElement('ion-icon');
                    icnonResilie.setAttribute('name', 'ban-outline');
                    icnonResilie.setAttribute('size', 'small');
                    icnonResilie.setAttribute('data-id_operatoire', post['id_operatoire']);
                    divEndcontrat.appendChild(icnonJuste);
                    divEndcontrat.appendChild(icnonResilie);
                    divContrat.appendChild(divEndcontrat);
                }

                iconfolder = document.createElement('ion-icon');
                iconfolder.setAttribute('name', 'folder-open');
                iconfolder.setAttribute('size', 'large');
                iconfolder.setAttribute('font-size', '64px');
                divContrat.appendChild(iconfolder);
                h5 = document.createElement('h5');
                h5.textContent = post['numero_dossier'];
                divContrat.appendChild(h5);
                h4 = document.createElement('h4');
                h4.textContent = post['nom_locataire'];
                h4.style.textAlign = "center";
                divContrat.appendChild(h4);
                p = document.createElement('p');
                p.style.fontSize = "12px";
                p.style.fontStyle = "italc";
                p.textContent = `${percent}%`;
                divContrat.appendChild(p);
                divProgressBar = document.createElement('div');
                divProgressBar.classList.add('progressBar');
                divProgression = document.createElement('div');
                divProgression.classList.add('progression');
                divProgression.style.width = `${percent}%`;
                divProgressBar.appendChild(divProgression);
                divContrat.appendChild(divProgressBar);
                document.querySelector("#table").appendChild(divContrat);
            }
        });
    } else {
        p = document.createElement('p');
        p.textContent = "Aucun contrat en cours";
        p.style.textAlign = "center";
        document.querySelector("#table").appendChild(p);
    }

    const iconsResiliation = document.querySelectorAll('#main3 [name="ban-outline"]');
    iconsResiliation.forEach((iconResiliation) => {
        iconResiliation.addEventListener('click', (e) => {
            activeResilition = confirm("Activez la résiliation de ce dossier?");
            if (activeResilition) {
                regex = /^([0-9]{2}[-/]){2}[0-9]{4}$/;
                dateResiliation = prompt("Entrez la date de résiliation de ce dossier", "01/01/2024");

                while (!regex.test(dateResiliation)) {
                    alert("Etrez la date dans le bon format ex: 01/01/2024");
                    dateResiliation = prompt("Entrez la date de résiliation de ce dossier", "01/01/2024");
                }

                let idResiliation = iconResiliation.getAttribute('data-id_operatoire');
                console.log(dateResiliation);
                window.location = `activeResiliation.php?id=${idResiliation}&dateResiliation=${dateResiliation}`;
            }
            e.stopPropagation();
        });
    });
} showContrat();

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

function verifDelai() {
    const contrats = document.querySelectorAll(".contrat");
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
        console.log(compte + " Contrat à surveiller dans cette ville");
    });
} verifDelai();

var modified;       //booleen verifiant le changement de la checkliste
const modify = document.querySelector('#main3 [name="pencil"]'); //bouton modifiier checkliste
const formElements = document.querySelectorAll('#main3 #checkliste #table2 input');
const submitButton = document.querySelector('#main3 button[type="submit"]');

//activation de la modification de la checkliste
modify.addEventListener("click", () => {
    formElements.forEach((element) => {
        element.disabled = (element.disabled) ? false : true;
        console.log("etat inputs form: " + element.disabled);
    });
});

//function affichage checkliste
function activeCheckliste() {
    const contrats = document.querySelectorAll(".contrat"); //liste des contrats
    const checkliste = document.querySelector("#checkliste"); //checkliste

    contrats.forEach((contrat) => {
        contrat.addEventListener("click", () => {
            //Afficher la checkliste
            checkliste.style.display = "block";
            var tabCheck = [];
            let k = 0;

            //desactivation de tous les inputs
            submitButton.style.display = "none";
            submitButton.style.disabled = true;
            modified = false;
            formElements.forEach((element) => {
                element.disabled = true;
            });

            //Mise à jours de l'entête
            document.querySelector("#dateAjout").textContent = "Date : " + contrat.getAttribute("data-date_ajout");
            document.querySelector("#numEspace").textContent = contrat.getAttribute("data-logement");
            document.querySelector("#nomClient").textContent = "Nom client : " + contrat.getAttribute("data-nom_client");
            document.querySelector("#numContrat").textContent = contrat.getAttribute("data-num_dossier");
            document.querySelector("#nomGI").textContent = "Nom gestionnaire : " + contrat.getAttribute("data-nom_Gi");
            document.querySelector("#nomSite").textContent = contrat.getAttribute("data-site");

            //recuperation des valeurs des inputs radio
            const choix = JSON.parse(contrat.dataset.choix);        //val_offre,elab_offre,control_final

            //Mise à jours des inputs
            document.querySelector("#main3 #negoce").checked = (contrat.getAttribute("data-negoce") == 1) ? true : false;
            document.querySelectorAll('#main3 input[type="radio"][name="val_off"]')[0].checked = (choix["val_offre"] === 1) ? 1 : (choix["val_offre"] === null) ? false : 0;
            document.querySelectorAll('#main3 input[type="radio"][name="val_off"]')[1].checked = (choix["val_offre"] === 0) ? 1 : (choix["val_offre"] === null) ? false : 0;
            document.querySelector("#main3 #info_client").checked = (contrat.getAttribute("data-info_client") == 1) ? true : false;
            document.querySelectorAll('#main3 input[type="radio"][name="elab_contrat"]')[0].checked = (choix["elab_contrat"] === 1) ? 1 : (choix["elab_contrat"] === null) ? false : 0;
            document.querySelectorAll('#main3 input[type="radio"][name="elab_contrat"]')[1].checked = (choix["elab_contrat"] === 0) ? 1 : (choix["elab_contrat"] === null) ? false : 0;
            document.querySelector("#main3 #trans_contrat").checked = (contrat.getAttribute("data-transmition_contrat_client") == 1) ? true : false;
            document.querySelector("#main3 #final_dossier").checked = (contrat.getAttribute("data-finalisation_dossier") == 1) ? true : false;
            document.querySelectorAll('#main3 input[type="radio"][name="control_final"]')[0].checked = (choix["control_final"] === 1) ? 1 : (choix["control_final"] === null) ? false : 0;
            document.querySelectorAll('#main3 input[type="radio"][name="control_final"]')[1].checked = (choix["control_final"] === 0) ? 1 : (choix["control_final"] === null) ? false : 0;
            document.querySelector("#main3 #val_doss").checked = (contrat.getAttribute("data-validation_dossier") == 1) ? true : false;
            document.querySelector("#main3 #trans_contrat_remise").checked = (contrat.getAttribute("data-trans_contrat_remise") == 1) ? true : false;
            document.querySelector("#main3 #trans_decharge").checked = (contrat.getAttribute("data-transmition_decharge") == 1) ? true : false;
            document.querySelector("#main3 #recept_doc").checked = (contrat.getAttribute("data-reception_dossier") == 1) ? true : false;
            document.querySelector("#main3 #archivage").checked = (contrat.getAttribute("data-archivage") == 1) ? true : false;
            document.querySelector('#main3 [name="id_operatoire"]').setAttribute("value", contrat.getAttribute("data-id_operatoire"));

            formElements.forEach(element => {
                element.setAttribute('data-numero', k);
                if (element.checked) {
                    tabCheck[k] = 1;
                } else {
                    tabCheck[k] = 0;
                }
                k++;
            });
            console.log(contrat.getAttribute("data-nom_client") + ": " + tabCheck);
        });
    });
} activeCheckliste();

// Contrôle du formulaire
formElements.forEach((element, index) => {
    // Ajouter un écouteur d'événement change à chaque input
    element.addEventListener('change', () => {
        element.checked = false;
        const numero = parseInt(element.getAttribute('data-numero'));
        console.log("Numero " + numero + " cliquée! et c'est un " + element.type);
        // Vérifier si l'input précédent est déjà coché
        if (numero > 0) {
            const previousInput = formElements[index - 1];
            console.log("Son previous est " + previousInput.getAttribute('data-numero') + " de type " + previousInput.type);

            if (previousInput.type === 'radio') {
                if (previousInput.name === element.name) {
                    const previous2 = formElements[index - 2];
                    if (previous2.checked) {
                        console.log("Le checkbox avant les radio est coché donc celui-ci aussi")
                        element.checked = true;
                        modified = true;
                        submitButton.style.display = "flex";
                        submitButton.style.disabled = false;
                    } else {
                        console.log("Le checkbox avant les radio n'est pas coché donc celui-ci aussi")
                        element.checked = false;
                    }
                } else {
                    // Vérifier s'il y a au moins un input radio coché dans le même groupe
                    const radioGroup = document.querySelectorAll(`input[name='${previousInput.name}']`);
                    const checkedRadio = Array.from(radioGroup).find(radio => radio.checked);
                    if (checkedRadio) {
                        console.log("Au moins un des inputs radio précédents est coché, donc cochez celui-ci aussi");
                        element.checked = true;
                        modified = true;
                        submitButton.style.display = "flex";
                        submitButton.style.disabled = false;
                    } else {
                        console.log("Aucun des inputs radio précédents n'est coché, donc décocher celui-ci");
                        element.checked = false;
                    }
                }
            } else if (previousInput.checked) {
                console.log("L'input précédent est déjà coché, donc cocher celui-ci aussi");
                element.checked = true;
                modified = true;
                submitButton.style.display = "flex";
                submitButton.style.disabled = false;
            } else {
                console.log("L'input précédent n'est pas coché, donc celui-ci non plus")
                element.checked = false;
            }
        }
    });
});

const croix = document.querySelector('#main3 #checkliste .croix');
croix.addEventListener('click', () => {
    if (modified == true) {
        alert("Veuillez enregistrez les modifications!");
        console.log("Veuillez enregistrez les modifications!");
        document.querySelector('#checkliste').scrollIntoView({ behavior: 'smooth', block: 'end' });
    } else {
        document.querySelector('#checkliste').style.display = "none";
        console.log("Fermeture de checkliste");
    }
});

const searchContrat = async () => {
    document.querySelector('#table').innerHTML = "";
    var villeSearched = document.querySelector('#zone').value;
    let keyword = document.querySelector('#search').value;
    if (keyword.length >= 2 || keyword.length == 0) {
        const req = await fetch(`searchMain3.php?search=${keyword}&ville=${villeSearched}`);
        const json = await req.json();
        if (json.length > 0) {
            json.forEach((post) => {
                if (post['etat'] != "En-Résiliation" && post['etat'] != "Résilié") {
                    var percent = 0;
                    var val_offre = (parseInt(post['validation_offre']) === 1 || parseInt(post['validation_offre']) === 0) ? 1 : 0;
                    var elab_contrat = (parseInt(post['elaboration_contrat']) === 1 || parseInt(post['elaboration_contrat']) === 0) ? 1 : 0;
                    var control_final = (parseInt(post['control_final']) === 1 || parseInt(post['control_final']) === 0) ? 1 : 0;
                    var choix = { "val_offre": parseInt(post['validation_offre']), "elab_contrat": parseInt(post['elaboration_contrat']), "control_final": parseInt(post['control_final']) };
                    percent = parseInt(post['negoce']) + val_offre + parseInt(post['info_client']) + elab_contrat + parseInt(post['transmition_contrat_client']) + parseInt(post['finalisation_dossier']) + control_final + parseInt(post['validation_dossier']) + parseInt(post['transmition_contrat_remise']) + parseInt(post['transmition_decharge']) + parseInt(post['reception_dossier']) + parseInt(post['archivage']);
                    percent = parseFloat(percent * 100 / 12).toFixed(2);
                    var divContrat = document.createElement('div');
                    divContrat.setAttribute('class', 'contrat');
                    divContrat.setAttribute('id', 'contrat' + parseInt(post['id_operatoire']));
                    divContrat.setAttribute('title', 'date fin : ' + post['date_fin_contrat']);
                    divContrat.setAttribute('data-num_dossier', post['numero_dossier']);
                    divContrat.setAttribute('data-choix', JSON.stringify(choix));
                    divContrat.setAttribute('data-id_operatoire', parseInt(post['id_operatoire']));
                    divContrat.setAttribute('data-logement', post['logement']);
                    divContrat.setAttribute('data-date_ajout', post['date_ajout']);
                    divContrat.setAttribute('data-date_fin', post['date_fin_contrat']);
                    divContrat.setAttribute('data-nom_client', post['nom_locataire']);
                    divContrat.setAttribute('data-site', post['site']);
                    divContrat.setAttribute('data-nom_Gi', post['nom_GI']);
                    divContrat.setAttribute('data-negoce', parseInt(post['negoce']));
                    divContrat.setAttribute('data-validation_offre', parseInt(post['validation_offre']));
                    divContrat.setAttribute('data-info_client', parseInt(post['info_client']));
                    divContrat.setAttribute('data-elaboration_contrat', parseInt(post['elaboration_contrat']));
                    divContrat.setAttribute('data-transmition_contrat_client', parseInt(post['transmition_contrat_client']));
                    divContrat.setAttribute('data-finalisation_dossier', parseInt(post['finalisation_dossier']));
                    divContrat.setAttribute('data-control_final', parseInt(post['control_final']));
                    divContrat.setAttribute('data-validation_dossier', parseInt(post['validation_dossier']));
                    divContrat.setAttribute('data-trans_contrat_remise', parseInt(post['transmition_contrat_remise']));
                    divContrat.setAttribute('data-transmition_decharge', parseInt(post['transmition_decharge']));
                    divContrat.setAttribute('data-reception_dossier', parseInt(post['reception_dossier']));
                    divContrat.setAttribute('data-archivage', parseInt(post['archivage']));
                    divContrat.setAttribute('onclick', "activeCheckliste()");

                    if (percent == 100) {   //Contrats actifs
                        var divEndcontrat = document.createElement('div');
                        divEndcontrat.classList.add('end_contrat');
                        icnonJuste = document.createElement('ion-icon');
                        icnonJuste.setAttribute('name', 'checkmark-circle-outline');
                        icnonJuste.setAttribute('size', 'small');
                        icnonResilie = document.createElement('ion-icon');
                        icnonResilie.setAttribute('name', 'ban-outline');
                        icnonResilie.setAttribute('size', 'small');
                        icnonResilie.setAttribute('data-id_operatoire', post['id_operatoire']);
                        divEndcontrat.appendChild(icnonJuste);
                        divEndcontrat.appendChild(icnonResilie);
                        divContrat.appendChild(divEndcontrat);
                    }

                    iconfolder = document.createElement('ion-icon');
                    iconfolder.setAttribute('name', 'folder-open');
                    iconfolder.setAttribute('size', 'large');
                    iconfolder.setAttribute('font-size', '64px');
                    divContrat.appendChild(iconfolder);
                    h5 = document.createElement('h5');
                    h5.textContent = post['numero_dossier'];
                    divContrat.appendChild(h5);
                    h4 = document.createElement('h4');
                    h4.textContent = post['nom_locataire'];
                    h4.style.textAlign = "center";
                    divContrat.appendChild(h4);
                    p = document.createElement('p');
                    p.style.fontSize = "12px";
                    p.style.fontStyle = "italc";
                    p.textContent = `${percent}%`;
                    divContrat.appendChild(p);
                    divProgressBar = document.createElement('div');
                    divProgressBar.classList.add('progressBar');
                    divProgression = document.createElement('div');
                    divProgression.classList.add('progression');
                    divProgression.style.width = `${percent}%`;
                    divProgressBar.appendChild(divProgression);
                    divContrat.appendChild(divProgressBar);
                    document.querySelector("#table").appendChild(divContrat);
                }
            });
        } else {
            p = document.createElement('p');
            p.style.textAlign = "center";
            p.style.width = "100%";
            p.textContent = "Aucun résultat!";
            document.querySelector('#table').appendChild(p);
        }
    }
    activeCheckliste();
    verifDelai();
};

function ActualiseNotif() {
    console.log("Valeur notification: " + compte);
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
    compte = 0;     //on réinitialise le compteur de notification
} ActualiseNotif();

const selectVille = document.querySelector('#main3 form #zone');

selectVille.addEventListener('change', (event) => {
    showContrat(event.target.value);
    verifDelai();
    activeCheckliste();
    ActualiseNotif();
});

function closePopup(popup) {
    popup.style.display = "none";
}

/*----------------------------------------------main4-------------------------------------------*/
const allResilies = document.querySelector('#allResiliations');
const dataResiliation = JSON.parse(allResilies.getAttribute('data-resultat'));

console.log("Tous les contrats résiliés: " + dataResiliation.length);

function showContratResilies(defaultSelected = "Douala") {
    document.querySelector("#tableResilie").innerHTML = "";
    if (dataResiliation.length >= 0) {
        dataResiliation.forEach((resilie) => {
            if (resilie['ville'] == defaultSelected) {
                var percent = 0;
                var control_val = (parseInt(resilie['controle_validation_dossier']) === 1 || parseInt(resilie['controle_validation_dossier']) === 0) ? 1 : 0;
                percent = parseInt(resilie['lettre_preavis']) + control_val + parseInt(resilie['transmition_elements']) + parseInt(resilie['prevalidation_dossier']) + parseInt(resilie['validation_provisoire']) + parseInt(resilie['transmition_element_provisoire']) + parseInt(resilie['transmition_reponse']) + parseInt(resilie['etat_lieux']) + parseInt(resilie['transmition_elements_complet']) + parseInt(resilie['approbation_dossier']) + parseInt(resilie['paiement_locataire']) + parseInt(resilie['archivage_resiliation']);
                percent = parseFloat(percent * 100 / 12).toFixed(2);

                var divResilie = document.createElement('div');
                divResilie.classList.add('contratResilie');
                iconDoc = document.createElement('ion-icon');
                iconDoc.setAttribute('name', 'document-text-outline');
                pId = document.createElement('p');
                pId.textContent = resilie['id_resiliation'];
                pNum = document.createElement('p');
                pNum.textContent = resilie['numero_dossier'];
                pNom = document.createElement('p');
                pNom.textContent = resilie['nom_locataire'];
                pNomGi = document.createElement('p');
                pNomGi.textContent = resilie['nom_GI'];
                pLogement = document.createElement('p');
                pLogement.textContent = resilie['logement'];
                pDateResiliation = document.createElement('p');
                pDateResiliation.textContent = resilie['date_resiliation'];
                divPercent = document.createElement('div');
                divPercent.classList.add('percent');
                p1 = document.createElement('p');
                p1.style.fontSize = "12px";
                p1.textContent = `${percent}%`;
                divProgressDivBar = document.createElement('div');
                divProgressDivBar.classList.add('progressDivBar');
                divProgressDiv = document.createElement('div');
                divProgressDiv.classList.add('progressDiv');
                divProgressDiv.style.width = `${percent}%`;
                if(percent == 100){
                    divProgressDiv.style.backgroundColor = "green";
                }
                divResilie.appendChild(iconDoc);
                divResilie.appendChild(pId);
                divResilie.appendChild(pNum);
                divResilie.appendChild(pNom);
                divResilie.appendChild(pNomGi);
                divResilie.appendChild(pLogement);
                divResilie.appendChild(pDateResiliation);
                divPercent.appendChild(p1);
                divProgressDivBar.appendChild(divProgressDiv);
                divPercent.appendChild(divProgressDivBar);
                divResilie.appendChild(divPercent);
                //meta-data
                divResilie.setAttribute('data-logement', resilie['logement']);
                divResilie.setAttribute('data-nom_client', resilie['nom_locataire']);
                divResilie.setAttribute('data-numero_dossier', resilie['numero_dossier']);
                divResilie.setAttribute('data-nom_GI', resilie['nom_GI']);
                divResilie.setAttribute('data-site', resilie['site']);
                divResilie.setAttribute('data-id_mode', resilie['id_mode']);
                divResilie.setAttribute('data-lettre_preavis', resilie['lettre_preavis']);
                divResilie.setAttribute('data-transmition_elements', resilie['transmition_elements']);
                divResilie.setAttribute('data-prevalidation_dossier', resilie['prevalidation_dossier']);
                divResilie.setAttribute('data-validation_provisoire', resilie['validation_provisoire']);
                divResilie.setAttribute('data-transmition_element_provisoire', resilie['transmition_element_provisoire']);
                divResilie.setAttribute('data-transmition_reponse', resilie['transmition_reponse']);
                divResilie.setAttribute('data-etat_lieux', resilie['etat_lieux']);
                divResilie.setAttribute('data-transmition_elements_complet', resilie['transmition_elements_complet']);
                divResilie.setAttribute('data-controle_validation_dossier', resilie['controle_validation_dossier']);
                divResilie.setAttribute('data-approbation_dossier', resilie['approbation_dossier']);
                divResilie.setAttribute('data-paiement_locataire', resilie['paiement_locataire']);
                divResilie.setAttribute('data-archivage_resiliation', resilie['archivage_resiliation']);
                divResilie.setAttribute('data-date_activation_resiliation', resilie['date_activation_resiliation']);
                divResilie.setAttribute('data-date_resiliation', resilie['date_resiliation']);
                document.querySelector("#tableResilie").appendChild(divResilie);
            }
        });
    } else {
        p = document.createElement('p');
        p.textContent = "Aucun contrat résilié";
        p.style.textAlign = "center";
        document.querySelector("#tableResilie").appendChild(p);
    }
} showContratResilies();

const choixVille = document.querySelector('#main4 form #zoneR');

choixVille.addEventListener('change', (event) => {
    showContratResilies(event.target.value);
    activeChecklisteResiliation();
});

const iconSearchResilie = document.querySelector('#main4 #formMain4 [name="search-outline"]');

searchMain4 = document.querySelector("#searchResilie");

searchMain4.addEventListener('input', async (event) => {
    let keyword = document.querySelector('#searchResilie').value;
    if (keyword.length >= 2 || keyword.length == 0) {
        if (event.target.value != "") {
            iconSearchResilie.style.display = "none";
        } else if (event.target.value == "") {
            iconSearchResilie.style.display = "block";
        }

        document.querySelector('#tableResilie').innerHTML = "";
        var villeSearched = document.querySelector('#zoneR').value;
        const req = await fetch(`searchMain4.php?search=${keyword}&ville=${villeSearched}`);
        const json = await req.json();
        if (json.length > 0) {
            json.forEach((resilie) => {
                var percent = 0;
                var control_val = (parseInt(resilie['controle_validation_dossier']) === 1 || parseInt(resilie['controle_validation_dossier']) === 0) ? 1 : 0;
                percent = parseInt(resilie['lettre_preavis']) + control_val + parseInt(resilie['transmition_elements']) + parseInt(resilie['prevalidation_dossier']) + parseInt(resilie['validation_provisoire']) + parseInt(resilie['transmition_element_provisoire']) + parseInt(resilie['transmition_reponse']) + parseInt(resilie['etat_lieux']) + parseInt(resilie['transmition_elements_complet']) + parseInt(resilie['approbation_dossier']) + parseInt(resilie['paiement_locataire']) + parseInt(resilie['archivage_resiliation']);
                percent = parseFloat(percent * 100 / 12).toFixed(2);

                var divResilie = document.createElement('div');
                divResilie.classList.add('contratResilie');
                iconDoc = document.createElement('ion-icon');
                iconDoc.setAttribute('name', 'document-text-outline');
                pId = document.createElement('p');
                pId.textContent = resilie['id_resiliation'];
                pNumero = document.createElement('p');
                pNumero.textContent = resilie['numero_dossier'];
                pNom = document.createElement('p');
                pNom.textContent = resilie['nom_locataire'];
                pNomGi = document.createElement('p');
                pNomGi.textContent = resilie['nom_GI'];
                pLogement = document.createElement('p');
                pLogement.textContent = resilie['logement'];
                pDateResiliation = document.createElement('p');
                pDateResiliation.textContent = resilie['date_resiliation'];
                divPercent = document.createElement('div');
                divPercent.classList.add('percent');
                p1 = document.createElement('p');
                p1.style.fontSize = "12px";
                p1.textContent = `${percent}%`;
                divProgressDivBar = document.createElement('div');
                divProgressDivBar.classList.add('progressDivBar');
                divProgressDiv = document.createElement('div');
                divProgressDiv.classList.add('progressDiv');
                divProgressDiv.style.width = `${percent}%`;
                if(percent == 100){
                    divProgressDiv.style.backgroundColor = "green";
                }
                divResilie.appendChild(iconDoc);
                divResilie.appendChild(pId);
                divResilie.appendChild(pNumero);
                divResilie.appendChild(pNom);
                divResilie.appendChild(pNomGi);
                divResilie.appendChild(pLogement);
                divResilie.appendChild(pDateResiliation);
                divPercent.appendChild(p1);
                divProgressDivBar.appendChild(divProgressDiv);
                divPercent.appendChild(divProgressDivBar);
                divResilie.appendChild(divPercent);
                //meta-data
                divResilie.setAttribute('data-logement', resilie['logement']);
                divResilie.setAttribute('data-nom_client', resilie['nom_locataire']);
                divResilie.setAttribute('data-numero_dossier', resilie['numero_dossier']);
                divResilie.setAttribute('data-nom_GI', resilie['nom_GI']);
                divResilie.setAttribute('data-site', resilie['site']);
                divResilie.setAttribute('data-id_mode', resilie['id_mode']);
                divResilie.setAttribute('data-lettre_preavis', resilie['lettre_preavis']);
                divResilie.setAttribute('data-transmition_elements', resilie['transmition_elements']);
                divResilie.setAttribute('data-prevalidation_dossier', resilie['prevalidation_dossier']);
                divResilie.setAttribute('data-validation_provisoire', resilie['validation_provisoire']);
                divResilie.setAttribute('data-transmition_element_provisoire', resilie['transmition_element_provisoire']);
                divResilie.setAttribute('data-transmition_reponse', resilie['transmition_reponse']);
                divResilie.setAttribute('data-etat_lieux', resilie['etat_lieux']);
                divResilie.setAttribute('data-transmition_elements_complet', resilie['transmition_elements_complet']);
                divResilie.setAttribute('data-controle_validation_dossier', resilie['controle_validation_dossier']);
                divResilie.setAttribute('data-approbation_dossier', resilie['approbation_dossier']);
                divResilie.setAttribute('data-paiement_locataire', resilie['paiement_locataire']);
                divResilie.setAttribute('data-archivage_resiliation', resilie['archivage_resiliation']);
                divResilie.setAttribute('data-date_activation_resiliation', resilie['date_activation_resiliation']);
                divResilie.setAttribute('data-date_resiliation', resilie['date_resiliation']);
                document.querySelector("#tableResilie").appendChild(divResilie);
            });
            activeChecklisteResiliation();
        } else {
            p = document.createElement('p');
            p.textContent = "Aucun contrat résilié ne porte ce nom dans cette ville";
            p.style.textAlign = "center";
            document.querySelector("#tableResilie").appendChild(p);
        }
    }
});

var modifiedR;
const modifyR = document.querySelector('#main4 [name="pencil"]'); //bouton modifiier checkliste
const formElementsR = document.querySelectorAll('#main4 #checklisteResiliation #table2R input');
const submitButtonR = document.querySelector('#main4 button[type="submit"]');

//activation de la modification de la checkliste
modifyR.addEventListener("click", () => {
    formElementsR.forEach((element) => {
        element.disabled = (element.disabled) ? false : true;
        console.log("etat inputs form: " + element.disabled);
    });
});

function activeChecklisteResiliation() {
    const contratResilies = document.querySelectorAll('#main4 .contratResilie');
    const checklisteResiliation = document.querySelector('#main4 #checklisteResiliation');

    contratResilies.forEach((contratResilie) => {
        contratResilie.addEventListener('click', () => {
            //Afficher la checkliste de résiliation
            checklisteResiliation.style.display = "block";
            var tabCheck = [];
            let k = 0;

            //desactivez tous les inputs
            submitButtonR.style.display = "none";
            submitButtonR.style.disabled = true;
            modifiedR = false;
            formElementsR.forEach((input) => {
                input.disabled = true;
            });

            //Remplissage des champs d'en-tête
            document.querySelector("#dateAjoutR").textContent = "Date : " + contratResilie.getAttribute('data-date_activation_resiliation'); //date_ajout_resiliation
            document.querySelector("#numEspaceR").textContent = contratResilie.getAttribute("data-logement");
            document.querySelector("#nomClientR").textContent = "Nom client : " + contratResilie.getAttribute("data-nom_client");
            document.querySelector("#numContratR").textContent = contratResilie.getAttribute("data-numero_dossier");
            document.querySelector("#nomGIR").textContent = "Nom gestionaire : " + contratResilie.getAttribute("data-nom_Gi");
            document.querySelector("#nomSiteR").textContent = contratResilie.getAttribute("data-site");
            // val_date_activation_resiliation = contratResilie.getAttribute('data-date_activation_resiliation');
            // val_date_resiliation = contratResilie.getAttribute('data-date_resiliation');

            //Mis à jour des inputs
            document.querySelector("#main4 #preavis").checked = (contratResilie.getAttribute('data-lettre_preavis') == 1) ? true : false;
            document.querySelector("#main4 #const_trans_elem_repert").checked = (contratResilie.getAttribute('data-transmition_elements') == 1) ? true : false;
            document.querySelector('#main4 #preval_dossier').checked = (contratResilie.getAttribute('data-prevalidation_dossier') == 1) ? true : false;
            document.querySelector("#main4 #val_dos_res").checked = (contratResilie.getAttribute('data-validation_provisoire') == 1) ? true : false;
            document.querySelector("#main4 #trans_elem_res").checked = (contratResilie.getAttribute('data-transmition_element_provisoire') == 1) ? true : false;
            document.querySelector('#main4 #trans_rep_client').checked = (contratResilie.getAttribute('data-transmition_reponse') == 1) ? true : false;
            document.querySelector("#main4 #etat_lieux").checked = (contratResilie.getAttribute('data-etat_lieux') == 1) ? true : false;
            document.querySelector("#main4 #const_trans_elem_res").checked = (contratResilie.getAttribute('data-transmition_elements_complet') == 1) ? true : false;
            document.querySelectorAll('#main4 [type="radio"][name="control_val"]')[0].checked = (contratResilie.getAttribute('data-controle_validation_dossier') == 1) ? 1 : (contratResilie.getAttribute('data-controle_validation_dossier') == null) ? false : 0;
            document.querySelectorAll('#main4 [type="radio"][name="control_val"]')[1].checked = (contratResilie.getAttribute('data-controle_validation_dossier') == 0) ? 1 : (contratResilie.getAttribute('data-controle_validation_dossier') == null) ? false : 0;
            document.querySelector("#main4 #approb_doc_final").checked = (contratResilie.getAttribute('data-approbation_dossier') == 1) ? true : false;
            document.querySelector('#main4 #paiement').checked = (contratResilie.getAttribute('data-paiement_locataire') == 1) ? true : false;
            document.querySelector("#main4 #archivage_doc").checked = (contratResilie.getAttribute('data-archivage_resiliation') == 1) ? true : false;
            document.querySelector('#main4 [name="id_mode"]').setAttribute("value", contratResilie.getAttribute("data-id_mode"));

            formElementsR.forEach(element => {
                element.setAttribute('data-numero', k);
                if (element.checked) {
                    tabCheck[k] = 1;
                } else {
                    tabCheck[k] = 0;
                }
                k++;
            });
            console.log(contratResilie.getAttribute("data-nom_client") + ": " + tabCheck);
        });
    });
} activeChecklisteResiliation();

// Contrôle du formulaire
formElementsR.forEach((element, index) => {
    // Ajouter un écouteur d'événement change à chaque input
    element.addEventListener('change', () => {
        element.checked = false;
        const numeroR = parseInt(element.getAttribute('data-numero'));
        console.log("Numero " + numeroR + " cliquée! et c'est un " + element.type);
        // Vérifier si l'input précédent est déjà coché
        if (numeroR > 0) {
            const previousInput = formElementsR[index - 1];
            console.log("Son previous est " + previousInput.getAttribute('data-numero') + " de type " + previousInput.type);

            if (previousInput.type === 'radio') {
                if (previousInput.name === element.name) {
                    const previous2 = formElementsR[index - 2];
                    if (previous2.checked) {
                        console.log("Le checkbox avant les radio est coché donc celui-ci aussi")
                        element.checked = true;
                        modifiedR = true;
                        submitButtonR.style.display = "flex";
                        submitButtonR.style.disabled = false;
                    } else {
                        console.log("Le checkbox avant les radio n'est pas coché donc celui-ci aussi")
                        element.checked = false;
                    }
                } else {
                    // Vérifier s'il y a au moins un input radio coché dans le même groupe
                    const radioGroup = document.querySelectorAll(`input[name='${previousInput.name}']`);
                    const checkedRadio = Array.from(radioGroup).find(radio => radio.checked);
                    if (checkedRadio) {
                        console.log("Au moins un des inputs radio précédents est coché, donc cochez celui-ci aussi");
                        element.checked = true;
                        modifiedR = true;
                        submitButtonR.style.display = "flex";
                        submitButtonR.style.disabled = false;
                    } else {
                        console.log("Aucun des inputs radio précédents n'est coché, donc décocher celui-ci");
                        element.checked = false;
                    }
                }
            } else if (previousInput.checked) {
                console.log("L'input précédent est déjà coché, donc cochez celui-ci aussi");
                element.checked = true;
                modifiedR = true;
                submitButtonR.style.display = "flex";
                submitButtonR.style.disabled = false;
            } else {
                console.log("L'input précédent n'est pas coché, donc celui-ci non plus")
                element.checked = false;
            }
        }
    });
});

const close = document.querySelector('#main4 #checklisteResiliation .croix');
close.addEventListener('click', () => {
    if (modifiedR == true) {
        alert("Veuillez enregistrez les modifications!");
        console.log("Veuillez enregistrez les modifications!");
        document.querySelector('#checklisteResiliation').scrollIntoView({ behavior: 'smooth', block: 'end' });
    } else {
        document.querySelector('#checklisteResiliation').style.display = "none";
    }
});
