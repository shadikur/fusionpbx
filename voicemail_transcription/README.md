# Happy to donate?
If you are happy to donate for the development and continous support to all my project to up and running, I would really appreciate your little donation.

DONATE VIA PAYPAL [https://www.paypal.me/shuvoqmul/USD]

# How to use
Solely prepared by Shadikur for FusionPBX<br>
Azure Congnitive Service has been used to obtain API Key<br>
For anytypes of questions / support request please email to support@shadikur.com<br>

```

cd /usr/share/freeswitch/scripts/app/voicemail/resources/functions
rm -rf record_message.lua
wget https://raw.githubusercontent.com/shadikur/fusionpbx/master/voicemail_transcription/record_message.lua
chown www-data:www-data record_message.lua
service freeswitch restart

```

Please make sure you configure the default settings for Voicemail.
Here is the settings you will need to add under voicemail category on Advance > Default Settings

``` 
Subcategory				type			value			enabled
transcribe_enabled			boolean			true			true
transcribe_language			text 			en-US			true
transcribe_provider			text 			azure 			true
azure_key1				text 			your_key1		true
azure_key2				text 			your_key2		true
azure_server_region			text 			location		true

```

This script has been tested in both latest stable and master branch of FusionPBX. Let us know if you need any help/ support
