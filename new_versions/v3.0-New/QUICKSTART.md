<h1>🚀 Hızlı Başlangıç Kılavuzu</h1>

<h2>Platform Seçin</h2>
<ul>
  <li><a href="#singleplayer-kurulum">🖥️ Singleplayer</a></li>
  <li><a href="#multiplayer-server-kurulum">🌐 Multiplayer Server</a></li>
  <li><a href="#hosting-panel-kurulum">☁️ Hosting Panel</a></li>
</ul>

<hr>

<h2 id="singleplayer-kurulum">🖥️ Singleplayer Kurulum</h2>

<h3>1️⃣ İndir (2 dosya gerekli)</h3>

<p><b>Bookshelf (Zorunlu):</b></p>
<pre><code>https://modrinth.com/datapack/bookshelf-dev/version/v3.2.2-1.21</code></pre>

<p><b>Bu Datapack:</b></p>
<pre><code>mc-server-toolkit-v2.8.zip</code></pre>

<hr>

<h3>2️⃣ Yükle</h3>

<p><b>Dünya datapacks klasörünü aç</b></p>

<p><b>Windows:</b></p>
<pre><code>%AppData%\.minecraft\saves\&lt;world-name&gt;\datapacks</code></pre>

<p><b>Linux:</b></p>
<pre><code>~/.minecraft/saves/&lt;world-name&gt;/datapacks</code></pre>

<p><b>Alternatif yöntem (oyun içinden):</b></p>
<ol>
  <li>Dünyayı seç</li>
  <li><b>Edit</b> → <b>Open World Folder</b></li>
  <li>Açılan klasörde <b>datapacks</b> klasörüne gir</li>
</ol>

<p>Sonra dosyaları şu sırayla yerleştir:</p>

<pre><code>saves/
  └── &lt;world-name&gt;/
      └── datapacks/
          ├── bookshelf-dev-1_21_11-v3_2_2.zip    ← ÖNCE BU
          └── mc-server-toolkit-v2.8.zip          ← SONRA BU
</code></pre>

<p>⚠️ <b>Sıralama Önemli!</b> Bookshelf önce yüklenmelidir.</p>

<hr>

<h3>3️⃣ Aktifleştir</h3>

<p>Oyuna gir ve şu komutları çalıştır:</p>

<pre><code>/reload
/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
</code></pre>

<hr>

<h3>4️⃣ Test Et</h3>

<pre><code>/trigger gss.trigger
</code></pre>

<p>✅ Eğer bir menü açıldıysa, başarılı! 🎉</p>

<hr>

<h2 id="multiplayer-server-kurulum">🌐 Multiplayer Server Kurulum</h2>

<h3>1️⃣ Server Properties Düzenle</h3>

<p><code>server.properties</code> dosyasını aç ve şunu ekle:</p>

<pre><code>enable-command-block=true
</code></pre>

<p>💡 <b>Konum:</b> <code>minecraft-server/server.properties</code></p>

<hr>

<h3>2️⃣ Datapack'leri Yükle</h3>

<pre><code>minecraft-server/
  └── world/
      └── datapacks/
          ├── bookshelf-dev-1_21_11-v3_2_2.zip
          └── mc-server-toolkit-v2.8.zip
</code></pre>

<hr>

<h3>3️⃣ Sunucuyu Başlat</h3>

<p>Sunucuyu başlat ve in-game:</p>

<pre><code>/reload
/gamerule send_command_feedback true
</code></pre>

<hr>

<h3>4️⃣ Test Et</h3>

<pre><code>/trigger gss.trigger
</code></pre>

<p>✅ Menü açıldıysa başarılı! 🎉</p>

<hr>

<h2 id="hosting-panel-kurulum">☁️ Hosting Panel Kurulum</h2>

<h3>1️⃣ Panel Ayarları</h3>

<p>Hosting panelinizde (Pterodactyl, Multicraft, vb.):</p>

<ol>
  <li><b>Settings</b> veya <b>Configuration</b> sekmesine git</li>
  <li><b>Command Blocks</b> veya <code>enable-command-block</code> bul</li>
  <li><b>Enabled</b> veya <b>true</b> yap</li>
  <li>Kaydet ve sunucuyu <b>restart</b> et</li>
</ol>

<hr>

<h3>2️⃣ Datapack'leri Yükle</h3>

<pre><code>world/datapacks/
  ├── bookshelf-dev-1_21_11-v3_2_2.zip
  └── mc-server-toolkit-v2.7.zip
</code></pre>

<hr>

<h3>3️⃣ Sunucuyu Restart Et</h3>

<p>Panel'den sunucuyu yeniden başlat, sonra in-game:</p>

<pre><code>/reload
/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
</code></pre>

<hr>

<h3>4️⃣ Test Et</h3>

<pre><code>/trigger gss.trigger
</code></pre>

<p>✅ Menü açıldıysa başarılı! 🎉</p>

<hr>

<h2>🎮 İlk Adımlar</h2>

<h3>Admin Yetkisi Ver</h3>
<pre><code>/tag @s add admin
</code></pre>

<h3>Log Görüntüleme Yetkisi Ver</h3>
<pre><code>/tag @s add gss_security.log._.info
</code></pre>

<h3>Admin Vision'ı Dene</h3>
<pre><code>/function gss_security:admin_vision/toggle
</code></pre>

<p>Duvarlara bakın - particle'lar görünüyor mu? ✨</p>

<h3>İstatistiklere Bak</h3>
<pre><code>/function gss_security:gui/stats
</code></pre>

<hr>

<h2>❓ Sorun mu Var?</h2>



<h3>"Function not found" Hatası</h3>

<p>Bu hata, Minecraft’ın ilgili fonksiyonu yükleyemediği anlamına gelir. Sebep sadece yanlış klasör değil, farklı teknik sorunlar da olabilir.</p>

<h4>Olası Nedenler</h4>
<ul>
  <li>Datapack yanlış klasöre yerleştirilmiş olabilir</li>
  <li>Zip içinde fazladan klasör olabilir</li>
  <li>Fonksiyon dosyasında komut hatası olabilir</li>
  <li><code>pack_format</code> sürümü uyumsuz olabilir</li>
  <li>Namespace veya dosya adı yanlış olabilir</li>
</ul>

<h4>1️⃣ Datapack yüklü mü kontrol et</h4>
<pre><code>/datapack list
</code></pre>

<p>Listede şu ikisi görünmelidir:</p>
<ul>
  <li><code>bookshelf</code></li>
  <li><code>mc-server-toolkit</code></li>
</ul>

<h4>2️⃣ Klasör yapısını kontrol et</h4>
<p>Doğru yapı:</p>

<pre><code>saves/
  └── &lt;world-name&gt;/
      └── datapacks/
          ├── bookshelf-dev-1_21_11-v3_2_2.zip
          └── mc-server-toolkit-v2.8.zip
</code></pre>

<p>Zip içinde ekstra klasör olmamalıdır.</p>

<h4>3️⃣ Minecraft sürümünü kontrol et</h4>
<pre><code>/version
</code></pre>

<p>Bu datapack için <b>1.21.6 veya üzeri</b> gereklidir.</p>

<h4>4️⃣ Log dosyasını kontrol et</h4>
<p>Fonksiyon yükleme hataları genelde chat’te görünmez. Oyunu kapatıp <code>latest.log</code> dosyasını kontrol edin.</p>

<p><b>Konum:</b></p>
<pre><code>.minecraft/logs/latest.log
</code></pre>

<p>Burada kırmızı hata satırları varsa, fonksiyon içinde komut hatası olabilir.</p>

<h4>5️⃣ Datapack’i yeniden yükle</h4>
<pre><code>/reload
</code></pre>











<h3>Komut Blokları Çalışmıyor</h3>
<p><b>Singleplayer:</b></p>
<pre><code>/gamerule command_blocks_enabled true
</code></pre>

<p><b>Multiplayer/Hosting:</b></p>
<pre><code>enable-command-block=true
</code></pre>
<p>Sunucuyu restart edin.</p>

<h3>Loglar Görünmüyor</h3>
<pre><code>/gamerule command_blocks_enabled true
/gamerule send_command_feedback true
/tag @s add gss_security.log._.info
</code></pre>

<h3>Dialog Açılmıyor</h3>
<pre><code>/version
/reload
</code></pre>

<h3>Yetki Hataları</h3>
<pre><code>/tag @s add admin
</code></pre>

<hr>

<h2>📚 Daha Fazla Bilgi</h2>
<p>Detaylı dokümantasyon için <code>README.md</code> dosyasına bakın.</p>

<hr>

<h2>🔗 Hızlı Linkler</h2>
<ul>
  <li><b>Bookshelf İndir:</b> https://modrinth.com/datapack/bookshelf-dev</li>
  <li><b>Minecraft Wiki (Dialog):</b> https://minecraft.wiki/w/Dialog</li>
  <li><b>Server Properties Rehberi:</b> https://minecraft.wiki/w/Server.properties</li>
</ul>

<p><b>Kolay gelsin! 🛡️</b></p>
