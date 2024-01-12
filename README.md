# People's History of Tech Website README

## Table of Contents

<!-- TOC -->
- [People's History of Tech Website README](#peoples-history-of-tech-website-readme)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Development](#development)
    - [Commands](#commands)
  - [Content Management System](#content-management-system)
    - [Local Development](#local-development)
  - [Deployment](#deployment)
  - [Contributing](#contributing)
  - [Help](#help)
    - [Bridgetown Questions/Gotchas](#bridgetown-questionsgotchas)
<!-- TOC -->

## Prerequisites

- [GCC](https://gcc.gnu.org/install/)
- [Make](https://www.gnu.org/software/make/)
- [Ruby](https://www.ruby-lang.org/en/downloads/)
  - `= 3.0.2`
- [Bridgetown Gem](https://rubygems.org/gems/bridgetown)
  - `gem install bridgetown -N`
- [Node](https://nodejs.org)
  - `= 19.3.0`
- [Yarn](https://yarnpkg.com)

## Install

After cloning down this repository:

```sh
cd peoples-history-of-tech
bundle install && yarn install
```
> Learn more: [Bridgetown Getting Started Documentation](https://www.bridgetownrb.com/docs/).

## Development

To start your site in development mode, run `bin/bridgetown start` and navigate to [localhost:4000](https://localhost:4000/)!

To preview unpublished pages, run with the  `--unpublished` switch.


### Commands

```sh
# running locally
bin/bridgetown build
bin/bridgetown start

# build & deploy to production
bin/bridgetown deploy

# load the site up within a Ruby console (IRB)
bin/bridgetown console
```

> Learn more: [Bridgetown CLI Documentation](https://www.bridgetownrb.com/docs/command-line-usage)

## Content Management System
Blog posts, team members, case studies, events, and job posts are all website resources that are driven through an integration with [NetlifyCMS](https://v1.netlifycms.org/).

### Local Development
In order to access the admin portal while developing locally simply
Open a new terminal from the projects root directory

Run the command
```bash
npx netlify-cms-proxy-server
```
This will start a proxy server for the admin portal at port 8081.

Then in a separate terminal window start up the bridgetown server.
With both servers running, you can navigate to http://localhost:4000/admin/# to see the admin portal.

## Contributing

1. Clone the fork using `git clone` to your local development machine.
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request
1. Ask for a review in the `#website` channel in Slack

## Help

### Bridgetown Questions/Gotchas

* **Why is the CMS complaining about duplicate collections?** You can work around this by `touch`ing the `src/admin/config.yml` file while the servers are both running, then refreshing the CMS page.
