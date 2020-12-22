<li class="{{ Request::is('farmers*') ? 'active' : '' }}">
    <a href="{{ route('farmers.index') }}"><i class="fa fa-edit"></i><span>Farmers</span></a>
</li>

<li class="{{ Request::is('cities*') ? 'active' : '' }}">
    <a href="{{ route('cities.index') }}"><i class="fa fa-edit"></i><span>Cities</span></a>
</li>

<li class="{{ Request::is('soilTypes*') ? 'active' : '' }}">
    <a href="{{ route('soilTypes.index') }}"><i class="fa fa-edit"></i><span>Soil Types</span></a>
</li>


<li class="{{ Request::is('farms*') ? 'active' : '' }}">
    <a href="{{ route('farms.index') }}"><i class="fa fa-edit"></i><span>Farms</span></a>
</li>

<li class="{{ Request::is('crops*') ? 'active' : '' }}">
    <a href="{{ route('crops.index') }}"><i class="fa fa-edit"></i><span>Crops</span></a>
</li>

<li class="{{ Request::is('farmCrops*') ? 'active' : '' }}">
    <a href="{{ route('farmCrops.index') }}"><i class="fa fa-edit"></i><span>Farm Crops</span></a>
</li>


<li class="{{ Request::is('cooperatives*') ? 'active' : '' }}">
    <a href="{{ route('cooperatives.index') }}"><i class="fa fa-edit"></i><span>Cooperatives</span></a>
</li>

<li class="{{ Request::is('cooperativeMembers*') ? 'active' : '' }}">
    <a href="{{ route('cooperativeMembers.index') }}"><i class="fa fa-edit"></i><span>Cooperative Members</span></a>
</li>

