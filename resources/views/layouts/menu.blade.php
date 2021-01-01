<li class="{{ Request::is('farmers*') ? 'active' : '' }}">
    <a href="{{ route('farmers.index') }}"><i class="fa fa-edit"></i><span>Çiftçiler</span></a>
</li>

<li class="{{ Request::is('cities*') ? 'active' : '' }}">
    <a href="{{ route('cities.index') }}"><i class="fa fa-edit"></i><span>Şehirler</span></a>
</li>

<li class="{{ Request::is('soilTypes*') ? 'active' : '' }}">
    <a href="{{ route('soilTypes.index') }}"><i class="fa fa-edit"></i><span>Toprak Türleri</span></a>
</li>


<li class="{{ Request::is('farms*') ? 'active' : '' }}">
    <a href="{{ route('farms.index') }}"><i class="fa fa-edit"></i><span>Arsalar</span></a>
</li>

<li class="{{ Request::is('crops*') ? 'active' : '' }}">
    <a href="{{ route('crops.index') }}"><i class="fa fa-edit"></i><span>Mahsüller</span></a>
</li>

<li class="{{ Request::is('farmCrops*') ? 'active' : '' }}">
    <a href="{{ route('farmCrops.index') }}"><i class="fa fa-edit"></i><span>Arsadaki Mahsüller</span></a>
</li>


<li class="{{ Request::is('cooperatives*') ? 'active' : '' }}">
    <a href="{{ route('cooperatives.index') }}"><i class="fa fa-edit"></i><span>Kooperatifler</span></a>
</li>

<li class="{{ Request::is('cooperativeMembers*') ? 'active' : '' }}">
    <a href="{{ route('cooperativeMembers.index') }}"><i class="fa fa-edit"></i><span>Kooperatife Üye Olanlar</span></a>
</li>

<li class="{{ Request::is('basequery*') ? 'active' : '' }}">
    <a href="{{ route('basequery') }}"><i class="fa fa-edit"></i><span>Özgün Sorgu</span></a>
</li>

<li class="{{ Request::is('solution8*') ? 'active' : '' }}">
    <a href="{{ route('solution8') }}"><i class="fa fa-edit"></i><span>(UNION)Sisteme Kayıtlı Tüm Adresler</span></a>
</li>

<li class="{{ Request::is('solution10*') ? 'active' : '' }}">
    <a href="{{ route('solution10get') }}"><i class="fa fa-edit"></i><span>Verilen Mahsulu Eken Ciftciler ve Kooperatifleri</span></a>
</li>

<li class="{{ Request::is('solution11*') ? 'active' : '' }}">
    <a href="{{ route('solution11get') }}"><i class="fa fa-edit"></i><span>Verilen Mahsulu Eken Ciftcilerin İsim ve Soyisimleri</span></a>
</li>

<li class="{{ Request::is('solution12*') ? 'active' : '' }}">
    <a href="{{ route('solution12') }}"><i class="fa fa-edit"></i><span>Bütün Arsaların Average Değerinden Küçük Olan Arsaları ve Sahiplerini Dönen Sorgu</span></a>
</li>

<li class="{{ Request::is('solution13*') ? 'active' : '' }}">
    <a href="{{ route('solution13get') }}"><i class="fa fa-edit"></i><span>(Func)Verilen sayidan daha fazla arsaya sahip olan ciftci bilgilerini döndüren sorgu</span></a>
</li>

<li class="{{ Request::is('solution14*') ? 'active' : '' }}">
    <a href="{{ route('solution14') }}"><i class="fa fa-edit"></i><span>(VIEW)Son Beş Yılda Arsalar ve Ekilen Ürünleri Dönen VIEW Sorgusu</span></a>
</li>
