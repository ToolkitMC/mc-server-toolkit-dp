<details>
  <summary>🇬🇧 ENGLISH</summary>

<h1 align="center">🧰 MC-ServerToolkit++</h1>

<p align="center">
<b>MC-ServerToolkit++</b> is an advanced, <b>management-focused</b>,
<b>modular</b>, and <b>fully vanilla-compatible</b> datapack designed for
Minecraft Java Edition servers.
</p>

<p align="center">
Built specifically for <b>server administrators, operators, and technical staff</b>.<br>
It is <b>not intended</b> for general player usage.
</p>

<p align="center">
<b>Status:</b> Full Release<br>
<b>Repository:</b>
<a href="https://github.com/rttbb556gv6gv667gv/MC-ServerToolkit-PP/tree/main/datapack">Main Datapack</a> ·
<a href="https://github.com/rttbb556gv6gv667gv/MC-ServerToolkit-PP/fork">Fork</a>
</p>

<hr>

<h2>📦 General Information</h2>

<table>
  <tr><th align="left">Project Type</th><td>Vanilla Datapack</td></tr>
  <tr><th align="left">Primary Goal</th><td>Server administration & technical tooling</td></tr>
  <tr><th align="left">Minecraft Version</th><td>1.21.7+</td></tr>
  <tr><th align="left">License</th><td>MIT</td></tr>
  <tr><th align="left">Release Stage</th><td><b>Stable</b></td></tr>
</table>

<hr>

<h2>🧭 Menus & Administration Systems</h2>

<h3>🔐 Authorized Menus</h3>

<p>Main administration menu:</p>
<pre><code>/function glc_menu:open/menu {id:1}</code></pre>

<p>Contextual admin action menu:</p>
<pre><code>/function actions:menu/open</code></pre>

<p>
These menus expose server-side tools such as player management,
world utilities, configuration toggles, and internal diagnostics.
</p>

<hr>

<h2>🎯 Trigger-Based Controls</h2>

<pre><code>/trigger gulce_menu</code></pre>
<p>Opens authorized administrative menus.</p>

<pre><code>/trigger gulce_trigger</code></pre>
<p>Reserved for experimental, utility, or internal triggers.</p>

<hr>

<h2>🧩 MultiCommand System</h2>

<pre><code>/function multicommand:add {command:"&lt;Command&gt;"}</code></pre>
<pre><code>/function multicommand:run_all</code></pre>
<pre><code>/function multicommand:clear</code></pre>

<p>
Allows batching and sequential execution of commands for automation and maintenance.
</p>

<hr>

<h2>🛠️ Custom Administration Tools</h2>

<h3>God Armor</h3>
<pre><code>/function custom:tools/godarmor {target:"&lt;Player&gt;"}</code></pre>
<p>Grants invulnerability-grade equipment to the specified player.</p>

<h3>Kick / Ban / Unban Menu</h3>
<pre><code>/function custom:tools/kick/menu</code></pre>
<p>GUI-based moderation tools.</p>

<hr>

<h2>🪧 Hologram System</h2>

<pre><code>/function custom:tools/hologram {
  x:"&lt;x&gt;",
  y:"&lt;y&gt;",
  z:"&lt;z&gt;",
  text:&lt;JSON&gt;
}</code></pre>

<p>
Creates static server-side holographic text using JSON Text Components.
</p>

<hr>

<h2>🚫 Critical Functions</h2>

<ul>
  <li>/function custom:diamond</li>
  <li>/function custom:set_day</li>
  <li>/function custom:weather_clear</li>
</ul>

<p>
These functions are part of the <b>core system layer</b>.
Removing or renaming them will break the datapack.
</p>

<hr>

<h2>🛡️ Security & Performance</h2>

<ul>
  <li>Tick-safe architecture</li>
  <li>Event-driven execution model</li>
  <li>No permanent heavy loops</li>
  <li>No vanilla-breaking exploits</li>
</ul>

<hr>

<h2>📜 License</h2>

<p>
This project is licensed under the <b>MIT License</b>.
</p>

<p><b>This project is technical, stable, and administrator-oriented.</b></p>

  
</details>




































<details>
  <summary>🇹🇷 TÜRKÇE</summary>

<h1 align="center">🧰 MC-ServerToolkit++</h1>

<p align="center">
<b>MC-ServerToolkit++</b>, Minecraft Java Edition sunucuları için geliştirilmiş,
<b>yönetim odaklı</b>, <b>modüler</b> ve <b>tamamen vanilla uyumlu</b> bir datapack’tir.
</p>

<p align="center">
<b>Sunucu yöneticileri, operatörler ve teknik ekip</b> için tasarlanmıştır.<br>
Genel oyuncu kullanımı amaçlanmaz.
</p>

<p align="center">
<b>Durum:</b> Tam Sürüm<br>
<b>Depo:</b>
<a href="https://github.com/rttbb556gv6gv667gv/MC-ServerToolkit-PP/tree/main/datapack">Ana Datapack</a> ·
<a href="https://github.com/rttbb556gv6gv667gv/MC-ServerToolkit-PP/fork">Fork</a>
</p>

<hr>

<h2>📦 Genel Bilgiler</h2>

<table>
  <tr><th align="left">Proje Türü</th><td>Vanilla Datapack</td></tr>
  <tr><th align="left">Ana Amaç</th><td>Sunucu yönetimi & teknik araçlar</td></tr>
  <tr><th align="left">Minecraft Sürümü</th><td>1.21.7+</td></tr>
  <tr><th align="left">Lisans</th><td>MIT</td></tr>
  <tr><th align="left">Sürüm Durumu</th><td><b>Stabil</b></td></tr>
</table>

<hr>

<h2>🧭 Menü ve Yönetim Sistemleri</h2>

<h3>🔐 Yetkili Menüleri</h3>

<pre><code>/function glc_menu:open/menu {id:1}</code></pre>
<pre><code>/function actions:menu/open</code></pre>

<p>
Oyuncu yönetimi, dünya araçları ve sunucu ayarlarını içerir.
</p>

<hr>

<h2>🎯 Trigger Tabanlı Kontroller</h2>

<pre><code>/trigger gulce_menu</code></pre>
<p>Yetkili yönetim menülerini açar.</p>

<pre><code>/trigger gulce_trigger</code></pre>
<p>Deneysel veya yardımcı tetiklemeler için ayrılmıştır.</p>

<hr>

<h2>🧩 Çoklu Komut Sistemi</h2>

<pre><code>/function multicommand:add {command:"&lt;Komut&gt;"}</code></pre>
<pre><code>/function multicommand:run_all</code></pre>
<pre><code>/function multicommand:clear</code></pre>

<p>
Bakım işlemleri ve admin otomasyonları için kullanılır.
</p>

<hr>

<h2>🛠️ Özel Yönetim Araçları</h2>

<pre><code>/function custom:tools/godarmor {target:"&lt;Oyuncu&gt;"}</code></pre>
<p>Belirtilen oyuncuya admin seviyesinde ekipman verir.</p>

<pre><code>/function custom:tools/kick/menu</code></pre>

<hr>

<h2>🪧 Hologram Sistemi</h2>

<pre><code>/function custom:tools/hologram {
  x:"&lt;x&gt;",
  y:"&lt;y&gt;",
  z:"&lt;z&gt;",
  text:&lt;JSON&gt;
}</code></pre>

<p>Sunucu içi sabit hologram yazıları oluşturur.</p>

<hr>

<h2>🚫 Kritik Fonksiyonlar</h2>

<ul>
  <li>/function custom:diamond</li>
  <li>/function custom:set_day</li>
  <li>/function custom:weather_clear</li>
</ul>

<p>
Bu fonksiyonlar çekirdek sistemin parçasıdır.
Silinmeleri datapack’in bozulmasına neden olur.
</p>

<hr>

<h2>🛡️ Güvenlik & Performans</h2>

<ul>
  <li>Tick-safe mimari</li>
  <li>Event tabanlı çalışma</li>
  <li>Sürekli ağır döngüler yok</li>
  <li>Vanilla dışı exploit içermez</li>
</ul>

<hr>

<h2>📜 Lisans</h2>

<p>Bu proje <b>MIT Lisansı</b> ile lisanslanmıştır.</p>

<p><b>Bu proje teknik, stabil ve yönetici odaklıdır.</b></p>

  
</details>
