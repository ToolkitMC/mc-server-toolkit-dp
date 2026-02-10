# 🔄 Loop Manager - Proper Tick System

<details open>
<summary><b>🇬🇧 English Version</b></summary>

<h2>❌ Problem: Schedule System</h2>

<p>The old system had each module scheduling itself:</p>

<pre><code class="language-mcfunction">schedule function global:tick 3t replace
schedule function custom_admin:handler/loop/all/1 2t replace
schedule function gulce_adminpower_addons:loop 5t replace
</code></pre>

<p><strong>Problems:</strong></p>
<ul>
<li>❌ Every module constantly rescheduling itself</li>
<li>❌ Cannot be stopped with return (crashes)</li>
<li>❌ Out of control during TPS drops</li>
<li>❌ Entire system crashes on schedule clear</li>
<li>❌ Hard to debug, unclear which module is running</li>
</ul>

<h2>✅ Solution: Loop Manager</h2>

<p><strong>Single centralized tick system:</strong></p>
<ul>
<li>✅ Runs from minecraft:tick tag</li>
<li>✅ Each module runs at its own interval</li>
<li>✅ Scoreboard counter based (NO schedule!)</li>
<li>✅ Stops with return</li>
<li>✅ TPS protected</li>
<li>✅ Easy to debug</li>
</ul>

<h2>📦 Structure</h2>

<pre><code>data/loop_manager/
├── function/
│   ├── init.mcfunction          # System initialization
│   ├── tick.mcfunction          # Main loop (minecraft:tick)
│   └── modules/
│       ├── global.mcfunction    # Every 3 ticks
│       ├── admin.mcfunction     # Every 2 ticks
│       ├── addons.mcfunction    # Every 5 ticks
│       ├── security.mcfunction  # Every 40 ticks
│       ├── menu.mcfunction      # Every tick
│       └── tracker.mcfunction   # Every 20 ticks
</code></pre>

<h2>⚙️ How It Works</h2>

<h3>1. Counter System</h3>

<p>Separate counter for each module:</p>
<pre><code class="language-mcfunction">scoreboard players add #global loop.counter 1
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
</code></pre>

<h3>2. Interval Settings</h3>

<pre><code class="language-mcfunction">#global  → 3 ticks  (150ms)
#admin   → 2 ticks  (100ms)
#addons  → 5 ticks  (250ms)
#security→ 40 ticks (2 seconds)
#menu    → 1 tick   (50ms)
#tracker → 20 ticks (1 second)
</code></pre>

<h3>3. Auto Reset</h3>

<p>Counter resets when module executes:</p>
<pre><code class="language-mcfunction"># In each module function:
scoreboard players set #global loop.counter 0
</code></pre>

<h2>🎮 Modules</h2>

<p><strong>Global (3 ticks)</strong></p>
<ul>
<li>Admin tool advancement</li>
<li>Config UI item control</li>
<li>Panel permission check</li>
</ul>

<p><strong>Admin (2 ticks)</strong></p>
<ul>
<li>Trigger control</li>
<li>Main loops</li>
<li>Permission control</li>
<li>Group check</li>
</ul>

<p><strong>Addons (5 ticks)</strong></p>
<ul>
<li>Permission tick systems</li>
<li>Trigger enables</li>
<li>Scoreboard operations</li>
<li>Data storage</li>
<li>Freeze handler</li>
</ul>

<p><strong>Security (40 ticks)</strong></p>
<ul>
<li>GSS trigger control</li>
<li>Anti-Xray scan</li>
<li>Admin Vision</li>
</ul>

<p><strong>Menu (Every tick)</strong></p>
<ul>
<li>Menu trigger</li>
<li>Loading scores</li>
<li>Dialog opening</li>
<li>Tag cleanup</li>
</ul>

<p><strong>Tracker (20 ticks)</strong></p>
<ul>
<li>New player registration</li>
<li>Online marking</li>
</ul>

<h2>🔧 Adding New Module</h2>

<p><strong>1. Define Interval</strong> (<code>init.mcfunction</code>):</p>
<pre><code class="language-mcfunction">scoreboard players set #mymodule loop.interval 10
scoreboard players set #mymodule loop.counter 0
</code></pre>

<p><strong>2. Add to Tick</strong> (<code>tick.mcfunction</code>):</p>
<pre><code class="language-mcfunction">scoreboard players add #mymodule loop.counter 1
execute if score #mymodule loop.counter >= #mymodule loop.interval run function loop_manager:modules/mymodule
</code></pre>

<p><strong>3. Create Module</strong> (<code>modules/mymodule.mcfunction</code>):</p>
<pre><code class="language-mcfunction"># Counter reset
scoreboard players set #mymodule loop.counter 0

# Operations
say Hello!
</code></pre>

<h2>📊 Performance</h2>

<p><strong>Old System (Schedule):</strong></p>
<pre><code>global:tick → 3t schedule → 3t schedule → 3t schedule...
admin:loop → 2t schedule → 2t schedule → 2t schedule...
addons:loop → 5t schedule → 5t schedule → 5t schedule...
</code></pre>
<p>= 3 separate schedule chains, out of control</p>

<p><strong>New System (Loop Manager):</strong></p>
<pre><code>minecraft:tick → loop_manager:tick → controlled module execution
</code></pre>
<p>= 1 centralized tick, full control</p>

<h2>🐛 Troubleshooting</h2>

<p><strong>Module not working</strong></p>
<pre><code class="language-mcfunction">/scoreboard players get #global loop.counter
</code></pre>

<p><strong>Change interval</strong></p>
<pre><code class="language-mcfunction">scoreboard players set #global loop.interval 5
/reload
</code></pre>

<p><strong>Debug</strong></p>
<pre><code class="language-mcfunction">/scoreboard objectives setdisplay sidebar loop.counter
</code></pre>

<h2>✅ Advantages</h2>

<ol>
<li><strong>Control:</strong> Clear when each module runs</li>
<li><strong>Performance:</strong> No unnecessary schedules</li>
<li><strong>Safety:</strong> Stops with return, doesn't crash</li>
<li><strong>Debug:</strong> Counters are visible</li>
<li><strong>Flexibility:</strong> Intervals easily adjustable</li>
<li><strong>TPS Protected:</strong> Nothing runs without players</li>
</ol>

<h2>🔥 Summary</h2>

<p><strong>Before:</strong></p>
<pre><code class="language-mcfunction">schedule function global:tick 3t replace
</code></pre>

<p><strong>Now:</strong></p>
<pre><code class="language-mcfunction">execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
</code></pre>

<p><strong>Result:</strong> Stable, controlled, debuggable system! 🚀</p>

<p><strong>Note:</strong> Old tick functions are deprecated and return 0.</p>

</details>

<details>
<summary><b>🇹🇷 Türkçe Versiyon</b></summary>

<h2>❌ Problem: Schedule Sistemi</h2>

<p>Eski sistemde her modül kendi schedule'ını yapıyordu:</p>

<pre><code class="language-mcfunction">schedule function global:tick 3t replace
schedule function custom_admin:handler/loop/all/1 2t replace
schedule function gulce_adminpower_addons:loop 5t replace
</code></pre>

<p><strong>Sorunlar:</strong></p>
<ul>
<li>❌ Her modül sürekli kendini yeniden schedule ediyor</li>
<li>❌ Return ile durdurulamıyor (çöküyor)</li>
<li>❌ TPS düşüşünde kontrol dışı</li>
<li>❌ Schedule clear yapınca tüm sistem çöküyor</li>
<li>❌ Debug zor, hangi modül çalışıyor belli değil</li>
</ul>

<h2>✅ Çözüm: Loop Manager</h2>

<p><strong>Tek bir merkezi tick sistemi:</strong></p>
<ul>
<li>✅ minecraft:tick tag'inden çalışır</li>
<li>✅ Her modül kendi interval'inde çalışır</li>
<li>✅ Scoreboard counter bazlı (schedule YOK!)</li>
<li>✅ Return ile durur</li>
<li>✅ TPS korumalı</li>
<li>✅ Debug kolay</li>
</ul>

<h2>📦 Yapı</h2>

<pre><code>data/loop_manager/
├── function/
│   ├── init.mcfunction          # Sistem başlatma
│   ├── tick.mcfunction          # Ana döngü (minecraft:tick)
│   └── modules/
│       ├── global.mcfunction    # Her 3 tick
│       ├── admin.mcfunction     # Her 2 tick
│       ├── addons.mcfunction    # Her 5 tick
│       ├── security.mcfunction  # Her 40 tick
│       ├── menu.mcfunction      # Her tick
│       └── tracker.mcfunction   # Her 20 tick
</code></pre>

<h2>⚙️ Nasıl Çalışır?</h2>

<h3>1. Counter Sistemi</h3>

<p>Her modül için ayrı counter:</p>
<pre><code class="language-mcfunction">scoreboard players add #global loop.counter 1
execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
</code></pre>

<h3>2. Interval Ayarları</h3>

<pre><code class="language-mcfunction">#global  → 3 tick  (150ms)
#admin   → 2 tick  (100ms)
#addons  → 5 tick  (250ms)
#security→ 40 tick (2 saniye)
#menu    → 1 tick  (50ms)
#tracker → 20 tick (1 saniye)
</code></pre>

<h3>3. Auto Reset</h3>

<p>Modül çalıştığında counter sıfırlanır:</p>
<pre><code class="language-mcfunction"># Her modül fonksiyonunda:
scoreboard players set #global loop.counter 0
</code></pre>

<h2>🎮 Modüller</h2>

<p><strong>Global (3 tick)</strong></p>
<ul>
<li>Admin tool advancement</li>
<li>Config UI item kontrolü</li>
<li>Panel yetkisi kontrolü</li>
</ul>

<p><strong>Admin (2 tick)</strong></p>
<ul>
<li>Trigger kontrolü</li>
<li>Ana döngüler</li>
<li>Permission kontrolü</li>
<li>Group check</li>
</ul>

<p><strong>Addons (5 tick)</strong></p>
<ul>
<li>Permission tick systems</li>
<li>Trigger enables</li>
<li>Scoreboard operations</li>
<li>Data storage</li>
<li>Freeze handler</li>
</ul>

<p><strong>Security (40 tick)</strong></p>
<ul>
<li>GSS trigger kontrolü</li>
<li>Anti-Xray scan</li>
<li>Admin Vision</li>
</ul>

<p><strong>Menu (Her tick)</strong></p>
<ul>
<li>Menu trigger</li>
<li>Loading skorları</li>
<li>Dialog açma</li>
<li>Tag temizliği</li>
</ul>

<p><strong>Tracker (20 tick)</strong></p>
<ul>
<li>Yeni oyuncu kaydı</li>
<li>Online işaretleme</li>
</ul>

<h2>🔧 Yeni Modül Ekleme</h2>

<p><strong>1. Interval Tanımla</strong> (<code>init.mcfunction</code>):</p>
<pre><code class="language-mcfunction">scoreboard players set #mymodule loop.interval 10
scoreboard players set #mymodule loop.counter 0
</code></pre>

<p><strong>2. Tick'e Ekle</strong> (<code>tick.mcfunction</code>):</p>
<pre><code class="language-mcfunction">scoreboard players add #mymodule loop.counter 1
execute if score #mymodule loop.counter >= #mymodule loop.interval run function loop_manager:modules/mymodule
</code></pre>

<p><strong>3. Modül Oluştur</strong> (<code>modules/mymodule.mcfunction</code>):</p>
<pre><code class="language-mcfunction"># Counter reset
scoreboard players set #mymodule loop.counter 0

# İşlemler
say Merhaba!
</code></pre>

<h2>📊 Performans</h2>

<p><strong>Eski sistem (Schedule):</strong></p>
<pre><code>global:tick → 3t schedule → 3t schedule → 3t schedule...
admin:loop → 2t schedule → 2t schedule → 2t schedule...
addons:loop → 5t schedule → 5t schedule → 5t schedule...
</code></pre>
<p>= 3 ayrı schedule chain, kontrol dışı</p>

<p><strong>Yeni sistem (Loop Manager):</strong></p>
<pre><code>minecraft:tick → loop_manager:tick → modülleri kontrollü çalıştır
</code></pre>
<p>= 1 merkezi tick, tam kontrol</p>

<h2>🐛 Sorun Giderme</h2>

<p><strong>Modül çalışmıyor</strong></p>
<pre><code class="language-mcfunction">/scoreboard players get #global loop.counter
</code></pre>

<p><strong>Interval değiştirme</strong></p>
<pre><code class="language-mcfunction">scoreboard players set #global loop.interval 5
/reload
</code></pre>

<p><strong>Debug</strong></p>
<pre><code class="language-mcfunction">/scoreboard objectives setdisplay sidebar loop.counter
</code></pre>

<h2>✅ Avantajlar</h2>

<ol>
<li><strong>Kontrol:</strong> Her modül ne zaman çalışacak belli</li>
<li><strong>Performans:</strong> Gereksiz schedule yok</li>
<li><strong>Güvenlik:</strong> Return ile durur, çökmez</li>
<li><strong>Debug:</strong> Counter'lar görünür</li>
<li><strong>Esneklik:</strong> Interval kolayca değiştirilebilir</li>
<li><strong>TPS Korumalı:</strong> Oyuncu yoksa hiçbiri çalışmaz</li>
</ol>

<h2>🔥 Özet</h2>

<p><strong>Eskiden:</strong></p>
<pre><code class="language-mcfunction">schedule function global:tick 3t replace
</code></pre>

<p><strong>Şimdi:</strong></p>
<pre><code class="language-mcfunction">execute if score #global loop.counter >= #global loop.interval run function loop_manager:modules/global
</code></pre>

<p><strong>Sonuç:</strong> Stabil, kontrollü, debuglanabilir sistem! 🚀</p>

<p><strong>Not:</strong> Eski tick fonksiyonları deprecated edildi ve return 0 yapıyor.</p>

</details>

---

**Made with ❤️ for stable Minecraft datapacks**
