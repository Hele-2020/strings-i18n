'use strict'

const fs = require('fs')

class StringsI18N {
    static trans(path, lang = 'fr') {
        try {
            const split = path.split('.')
            if (split.length != 2) {
                throw `Path ${path} is not correctly formatted.`
            }
            const file = split.shift()
            const desc = split.shift()
            if (!fs.existsSync(`${__dirname}/lang/${lang}`)) {
                throw `Lang ${lang} is not defined.`
            }
            if (!fs.existsSync(`${__dirname}/lang/${lang}/${file}.json`)) {
                throw `File ${file}.json not found in ${lang}.`
            }
            let content = JSON.parse(fs.readFileSync(`${__dirname}/lang/${lang}/${file}.json`))
            return content[desc] || path
        } catch (e) {
            console.error(e)
            return path
        }
    }
}


console.log(StringsI18N.trans('errors.E_USERNAME_REQUIRED', 'en'))

module.exports = StringsI18N