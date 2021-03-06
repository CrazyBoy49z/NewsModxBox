
<noindex>
    
    {$request = $smarty.post}
    
    {if $request}
        {$modx->error->reset()}
        {processor action="web/forms/feedback" ns="modxsite" params=$request assign=form_result}
    {/if}
    
    
    {if !$form_result.success}
        <div class="row">
            <div class="col-xs-12 col-md-9">
                <form name="order_form" action="{link id=$modx->resource->id}?action=submit" method="post">
                    
                    
                    <div class="panel panel-default">
                        
                        <div class="panel-heading">
                            <h2>Написать нам</h2>
                        </div>
                        
                        <div class="panel-body">
                            
                            <div class="form-group {if $form_result.field_errors.fullname}has-error{/if}">
                                <label for="fullname">Имя</label>
                                {if $form_result.field_errors.fullname}
                                    <span class="help-inline text-danger">{$form_result.field_errors.fullname}</span>
                                {/if}
                                <div class="">
                                    <input id="fullname" class="form-control" placeholder="Как вас зовут?" type="text" value="{if $request.fullname}{$request.fullname}{else}{$profile.fullname}{/if}" name="fullname">
                                </div>
                            </div>
                            
                        
                            <div class="form-group {if $form_result.field_errors.email}has-error{/if}">
                                <label for="email">Электронная почта</label>
                                {if $form_result.field_errors.email}
                                    <span class="help-inline text-danger">{$form_result.field_errors.email}</span>
                                {/if}
                                {if $profile.email}
                                    <div class="">
                                        <input type="hidden" value="{$profile.email}" name="email">
                                        <input id="email" class="form-control" type="text" value="{$profile.email}" disabled>
                                    </div>
                                {else}
                                    <div class="">
                                        <input id="email" class="form-control" placeholder="Адрес электронной почты" type="text" value="{$request.email}" name="email">
                                    </div>
                                {/if}
                            </div>
                            
                        
                            <div class="form-group {if $form_result.field_errors.phone}has-error{/if}">
                                <label for="phone">Телефон</label>
                                {if $form_result.field_errors.phone}
                                    <span class="help-inline text-danger">{$form_result.field_errors.phone}</span>
                                {/if}
                                <div class="">
                                    <input id="phone" class="form-control" placeholder="Номер телефона для связи" type="text" value="{if $request.phone}{$request.phone}{else}{$profile.phone}{/if}" name="phone">
                                </div>
                            </div>
                            
                        
                            <div class="form-group {if $form_result.field_errors.message}has-error{/if}">
                                <label for="message">Текст сообщения</label>
                                {if $form_result.field_errors.message}
                                    <span class="help-inline text-danger">{$form_result.field_errors.message}</span>
                                {/if}
                                <div class="">
                                    <textarea rows="10" id="message" class="form-control" placeholder="Ваш вопрос или пожелание" name="message">{$request.message}</textarea>
                                </div>
                            </div>
                            
                            {if !$request OR $form_result.field_errors.captcha OR !$request.captcha}
                            
                                <div class="form-group {if $form_result.field_errors.captcha}has-error{/if}"> 
                                    <label for="captcha">Введите код с картинки</label>
                                    <input id="captcha" type="text" class="form-control w150" placeholder="Проверочный код" name="captcha" value="" />
                                    [[$modcaptcha]]
                                    {if $form_result.field_errors.captcha}
                                        <div>
                                            <span class="help-inline">{$form_result.field_errors.captcha}</span>
                                        </div>
                                    {/if}
                                </div>
                                
                            {else}
                                <input type="hidden" name="captcha" value="{$request.captcha}" />
                            {/if}
                            
                        </div>
                        
                        <div class="panel-footer">
                            <input type="submit" class="btn btn-primary" name="submit" value="Отправить" />
                        </div>
                        
                    </div>
                     
                
            </form> 
            </div>
        </div>   
    {else}
        <div class="alert alert-success">
            {$form_result.message|default:"Спасибо! Ваше сообщение принято."}
        </div>
    {/if}
    
</noindex> 
    
        