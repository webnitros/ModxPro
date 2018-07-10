{include 'file:chunks/users/_header.tpl' profile=$profile author=$author}

<div class="user-content">
    <div class="d-flex flex-wrap no-gutters">
        <div class="col-12 col-md-6 pr-md-2">
            <h5>{$.en ? 'Statistics' : 'Статистика'}</h5>
            <table>
                <tr>
                    <th>{$.en ? 'Topics' : 'Заметки'}</th>
                    <td>{$author.topics | number}</td>
                </tr>
                <tr>
                    <th>{$.en ? 'Comments' : 'Комментарии'}</th>
                    <td>{$author.comments | number}</td>
                </tr>
                <tr>
                    <th>{$.en ? 'Registration' : 'Регистрация'}</th>
                    <td>{$author.createdon | dateago}</td>
                </tr>
                <tr>
                    <th>{$.en ? 'Activity' : 'Активность'}</th>
                    <td>{$author.visitedon | dateago}</td>
                </tr>
            </table>
        </div>
        <div class="col-12 col-md-6 pl-md-2 pt-5 pt-md-0">
            <h5>{$.en ? 'Information' : 'Информация'}</h5>
            <table>
                {if $website}
                    <tr>
                        <td>{$.en ? 'Website' : 'Вебсайт'}</td>
                        <td><a href="http://{$website.url}" target="_blank">{$website.name}</a></td>
                    </tr>
                {/if}
                {if $profile.city}
                    <tr>
                        <td>{$.en ? 'City' : 'Город'}</td>
                        <td>{$profile.city}</td>
                    </tr>
                {/if}
                <tr>
                    <td>{$.en ? 'Accepts orders' : 'Принимает заказы'}?</td>
                    <td>
                        {if $profile.work}
                            <span class="badge badge-success">{$.en ? 'Yes' : 'Да'}</span>
                        {else}
                            <span class="badge badge-secondary">{$.en ? 'No' : 'Нет'}</span>
                        {/if}
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="d-flex flex-wrap no-gutters pt-5 ">
        <div class="col-12 col-md-6 pr-md-2">
            <h5>{$.en ? 'Rating' : 'Рейтинг'}</h5>
            <table>
                <tr>
                    <th>{$.en ? 'Total rating' : 'Итоговый рейтинг'}</th>
                    <td>
                        <span class="{if $author.rating > 0}text-success{/if}{if $author.rating < 0}text-danger{/if}">
                            {$author.rating | number : 1}
                        </span>
                    </td>
                </tr>
                <tr>
                    <th>{$.en ? 'Topics rating' : 'Рейтинг заметок'}</th>
                    <td>
                        <span class="text-success">+ {$author.topics_votes_up | number}</span> /
                        <span class="text-danger">- {$author.topics_votes_down | number}</span>
                    </td>
                </tr>
                <tr>
                    <th>{$.en ? 'Comments rating' : 'Рейтинг комментов'}</th>
                    <td>
                        <span class="text-success">+ {$author.comments_votes_up | number}</span> /
                        <span class="text-danger">- {$author.comments_votes_down | number}</span>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        {$.en ? 'Added to favorites by other users' : 'Добавлено в избранное другими пользователями'}:
                    </th>
                </tr>
                <tr>
                    <th class="pl-3">- {$.en ? 'topics' : 'заметки'}</th>
                    <td>
                        {$author.topics_stars | number}
                        {if $.en}
                            {$author.topics_stars | declension : 'time|times'}
                        {else}
                            {$author.topics_stars | declension : 'раз|раза|раз'}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <th class="pl-3">- {$.en ? 'comments' : 'комментарии'}</th>
                    <td>
                        {$author.comments_stars | number}
                        {if $.en}
                            {$author.comments_stars | declension : 'time|times'}
                        {else}
                            {$author.comments_stars | declension : 'раз|раза|раз'}
                        {/if}
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-12 col-md-6 pl-md-2 pt-5 pt-md-0">
            {if $services}
                <h5>{$.en ? 'Profiles' : 'Профили'}</h5>
                <table>
                    {foreach $services as $service}
                        <tr>
                            <th>{$service.name}</th>
                            <td>
                                {if $service.link}
                                    <a href="{$service.link}/{$service.user}" target="_blank">{$service.user}</a>
                                {else}
                                    {$service.user}
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            {/if}
        </div>
    </div>

    {if $profile.comment}
        <div class="comment pt-5">
            <h5>{$.en ? 'About' : 'О себе'}</h5>
            <p>{$profile.comment | jevix}</p>
        </div>
    {/if}
</div>