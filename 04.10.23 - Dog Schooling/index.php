<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <title>Centrum szkoleniowe dla psów</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="all">
  <header></header>
  <section>
    <table id="images">
      <tr>
        <td><img src="piesek1.png" alt="pies"></td>
        <td><img src="piesek2.png" alt="pies"></td>
        <td><img src="piesek3.png" alt="pies"></td>
        <td><img src="piesek4.png" alt="pies"></td>
        <td><img src="piesek5.png" alt="pies"></td>
        <td><img src="piesek6.png" alt="pies"></td>
        <td><img src="piesek7.png" alt="pies"></td>
        <td><img src="piesek8.png" alt="pies"></td>
      </tr>
    </table>
    <p id="quote">
      Nie ma na świecie przyjaźni, która trwa wiecznie.<br>
      Jedynym wyjątkiem jest ta, którą obdarza nas pies.
    </p>
    <h3>Konrad Lorenz</h3>
  </section>
  <aside>
    <p>
      Kursy w naszym ośrodku prowadzone są w sposób rzetelny.
      Atmosfera jest przyjazna zwierzętom i ich opiekunom.
      Zapewniamy indywidualne podejście do każdego psa i jego przewodnika.
    </p>
    <br>
    <p>
      Staramy się, aby każdy z uczestników czuł się komfortowo.
      Szkolenie szczeniaków i dorosłych psów dostosowujemy do temperamentu zwierzęcia oraz jego wieku,
      ponieważ każdy pies wymaga indywidualnego podejścia i zastosowania odpowiednich technik szkoleniowych.
    </p>
    <br>
    <p>
      Podczas trwania kursu nasi instruktorzy służą swoim wsparciem i doświadczeniem,
      dzięki czemu szybko nawiążesz kontakt ze swoim psiakiem.
    </p>
  </aside>
  <main>
    <h2>KALENDARZ SZKOLEŃ</h2>
    <table id="info">
      <tr>
        <th>Nazwa szkolenia</th>
        <th>Data rozpoczęcia</th>
        <th>Koszt</th>
      </tr>
      <tr>
        <td>Psie przedszkole (grupa P1)</td>
        <td>03-10-2020</td>
        <td>500zł</td>
      </tr>
      <tr>
        <td>Posłuszeństwo psa (grupa P2)</td>
        <td>10-10-2020</td>
        <td>600zł</td>
      </tr>
      <tr>
        <td>osłuszeństwo psa (grupa P3)</td>
        <td>07-11-2020</td>
        <td>600zł</td>
      </tr>
      <tr>
        <td>Psie przedszkole (grupa P4)</td>
        <td>14-11-2020</td>
        <td>500zł</td>
      </tr>
    </table>

    <h2>Formualarz zgłoszeniowy</h2>
    <form action="send.php" method="post">
      <fieldset>
        <legend>Dane właściciela</legend>
        <table>
          <tr>
            <td><label for="name">Imię:</label></td>
            <td><input type="text" name="name" id="name"></td>
          </tr>
          <tr>
            <td><label for="surname">Nazwisko: </label></td>
            <td><input type="text" name="surname" id="surname"></td>
          </tr>
          <tr>
            <td><label for="email">Adres mailowy:</label></td>
            <td><input type="email" name="email" id="email"><br></td>
          </tr>
        </table>
      </fieldset>
      <fieldset>
        <legend>Dane psa</legend>
        <table>
          <tr>
            <td><label for="dog-name">Imię:</label></td>
            <td><input type="text" name="dog-name" id="dog-name"></td>
          </tr>
          <tr>
            <td><label for="breed">Rasa: </label></td>
            <td><input type="text" name="breed" id="breed"></td>
          </tr>
          <tr>
            <td><label for="birth-date">Data urodzenia:</label></td>
            <td><input type="date" name="birth-date" id="birth-date"></td>
          </tr>
          <tr>
            <td><label for="schooling-type">Typ szkolenia:</label></td>
            <td>
              <select name="schooling-type" id="schooling-type">
                <option value="1">Psie przedszkole (P1)</option>
                <option value="2">Posłuszeństwo psa (P2)</option>
                <option value="4">Posłuszeństwo psa (P3)</option>
                <option value="3">Psie przedszkole (P4)</option>
              </select>
            </td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" value="Wyślij zgłoszenie"></td>
          </tr>
        </table>
          <?php
            if ($_SESSION['send']) {
                echo "Zgłoszenie zostało zapisane w bazie";
            }
          ?>
      </fieldset>
    </form>
  </main>
</div>
</body>
</html>