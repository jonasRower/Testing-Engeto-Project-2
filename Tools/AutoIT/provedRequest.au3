#include <AutoItConstants.au3>


zadejUrlASpustRequestAExportujJson(750, 130, 20)


Func zadejUrlASpustRequestAExportujJson($X, $Y, $cisloStudenta)

	MouseClick($MOUSE_CLICK_LEFT, $X, $Y, 3)

	$url = "https://test-app.engeto.cz/students/" & $cisloStudenta
	send($url)

	Sleep(500)
	send("^{Enter}")

	exportujResponse($cisloStudenta)

endFunc


Func exportujResponse($cisloStudenta)

	Sleep(1000)
	send("{Tab}")
	send("{Tab}")
	send("{ENTER}")
	Sleep(1000)

	send("{UP}")
	send("{ENTER}")
	Sleep(1000)

	$jsonCisloStudenta = "students_" & $cisloStudenta & ".json"
	send($jsonCisloStudenta)
	send("{ENTER}")

endFunc