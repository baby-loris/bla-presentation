if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo -e "Start updating gh-pages\n"

    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis"

    git clone -b gh-pages https://${GH_TOKEN}@github.com/baby-loris/bla-presentation.git deploy
    cd deploy
    rm -rf *
    rm .gitignore
    cp -r ../node_modules .
    cp -r ../pictures .
    cp ../index.html .
    git add -A
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages"
    git push origin gh-pages

    echo -e "Finish updating gh-pages\n"
fi
