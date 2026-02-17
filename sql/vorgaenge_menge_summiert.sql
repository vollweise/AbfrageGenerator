SELECT
    tblAdressen.Kundengruppe,
    tblAufpos.Zeile1,
    tblAufpos.Zeile2,
    tblAufpos.Zeile3,
    tblAufpos.Zeile4,
    tblAufpos.Zeile5,
    tblAufpos.Zeile6,
    SUM(tblAufpos.Menge) AS SummeMenge
FROM
    (tblAufkopf
        INNER JOIN tblAufpos ON tblAufkopf.Intern = tblAufpos.Intern)
    INNER JOIN tblAdressen ON tblAufkopf.Adresse = tblAdressen.Adresse
WHERE
    tblAufkopf.AktuellesDatumVorgang FilterEins
    AND tblAufkopf.Bearbeitungsindex FilterZwei
    AND tblAdressen.Kundengruppe FilterDrei
GROUP BY
    tblAdressen.Kundengruppe,
    tblAufpos.Zeile1,
    tblAufpos.Zeile2,
    tblAufpos.Zeile3,
    tblAufpos.Zeile4,
    tblAufpos.Zeile5,
    tblAufpos.Zeile6
ORDER BY
    tblAdressen.Kundengruppe,
    tblAufpos.Zeile1;

/*Datum muss immer im Englischen format angegeben werdeb also Monat Tag und Jahr*/
