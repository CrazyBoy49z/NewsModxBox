{extends "inc/articles/list.tpl"}
 
{block news_headers}<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:yandex="http://news.yandex.ru">
{/block}
 
{block news_params append}

    {$site_name = $modx->getOption('site_name')}
    {$site_url = $modx->getOption('site_url')}

    {$params = array_merge($params, [
        "in_rss_only"   => true,
        "limit" => 20
    ])} 
    
    {$pagination = false}
    
{/block}

{block news_fetch}
 
<channel>
    <title>{$site_name}</title>
    <link>{$site_url}</link>
    <description>{$site_name}</description>
    <image>
        {*<url>{$site_url}{$template_url}img/rss.gif</url>
        <title>{$site_name}</title>
        <link>{$site_url}</link>*}
    </image>
    {foreach $result.object as $object}
    <item>
        <title>{$object.pagetitle}</title>
        <link>{$site_url}{$object.uri}</link>
        <description>{mb_substr(strip_tags($object.description|default:$object.content), 0, 380, 'utf-8')}...</description>
        <category>{$object.section_title}</category>
        <pubDate>{date('D, d M y H:i:s O', $object.publishedon)}</pubDate>
        <yandex:full-text>{$object.content|strip_tags|htmlspecialchars}</yandex:full-text>
    </item>
    {/foreach}
</channel>
</rss>

{/block}
 
{*
<item>
        <title>"Прямая линия" с Владимиром Путиным пройдет 16 апреля</title>
        <link>http://www.dp.ru/a/2015/04/08/Prjamaja_linija_s_Vladimir</link>
        <description>"Прямая линия" с россиянами президента РФ Владимира Путина состоится 16 апреля, с четверга - 9 апреля - начинается сбор вопросов. К "прямой линии" выйдет специальное мобильное приложение "Москва — Путину". Вопросы можно будет задать посредством SMS или MMS, а также по телефону. "Прямая линия" президента России Владимира Путина состоится в четверг, 16 апреля, сообщил пресс-се...</description>
        <category>Новости dp.ru</category>
        <category>Деловая газета.Юг</category>
        <pubDate>Wed, 08 Apr 2015 12:41:03 +0300</pubDate>
        <yandex:full-text> "Прямая линия" с россиянами президента РФ Владимира Путина состоится 16 апреля, с четверга - 9 апреля - начинается сбор вопросов. К "прямой линии" выйдет специальное мобильное приложение "Москва — Путину". Вопросы можно будет задать посредством SMS или MMS, а также по телефону.  "Прямая линия" президента России Владимира Путина состоится в четверг, 16 апреля, сообщил пресс-секретарь президента Дмитрий Песков. Он уточнил, что за неделю, то есть с четверга, 9 апреля, начнется прием вопросов.   Обратиться к Путину можно будет задать через сайт, а также записать видеовопрос с помощью любого мобильного устройства. К "прямой линии" также выйдет специальное мобильное приложение "Москва — Путину".  Для использования этого приложения была упрощена система регистрации. "Если в прошлом году была достаточно сложная система регистрации, как выяснилось, сейчас это упростили. И можно автоматически через свой аккаунт ВКонтакте, Одноклассниках и Фейсбуке в нем зарегистрироваться", - поясни ТАСС Песков.  Кроме того, по словам представителя Кремля, "можно будет посредством СМС или ММС задать вопрос президенту". "Естественно, телефонные звонки со всей территории страны будут приниматься, обрабатываться. Сбор вопросов будет осуществляться до последней секунды "Прямой линии", как это традиционно было", - заверил Песков.  Дмитрий Песков, рассказывая о подготовке Путина к "прямой линии", отметил, что президент не знает заранее, какие вопросы будут ему задаваться. Путин обычно изучает популярные поступившие вопросы, запрашивает всю необходимую информацию в министерствах, в результате чего сотрудники ведомств "работают до упора". </yandex:full-text>
    </item>
*}

