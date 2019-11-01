import React from "react"
import PropTypes from "prop-types"
import { Button, FormGroup, MenuItem } from "@blueprintjs/core";
import { ItemRenderer, Select } from "@blueprintjs/select";

class HunterCreator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      playbooks: [],
      selectedPlaybook: undefined,
    };
  }

  componentDidMount() {
    this.fetchPlaybooks();
  }

  fetchPlaybooks() {
    fetch('/playbooks.json')
      .then(response => response.json())
      .then((data) => {
        this.setState({
          playbooks: data
        });
        console.log(data);
      },
      (error) => {
        console.log(error);
      });
  }

  onSelectPlaybook(playbook) {
    this.setState({
      selectedPlaybook: playbook
    });
  }

  render () {
    return (
      <div>
      <p> Start </p>
      <FormGroup label="Name" labelFor="name-input" labelInfo="(required)">
        <input id="name-input" classes="bp3-input" type="text" placeholder="Hunter Name" dir="auto" />
      </FormGroup>
      <FormGroup label="Playbook" labelFor="playbook-input" labelInfo="(required)">
        <Select
          items={this.state.playbooks}
          itemRenderer={playbookRenderer}
          onItemSelect={this.onSelectPlaybook}
          filterable={false}
          noResults={<MenuItem disabled={true} text="No results." />}
          popoverProps={{ minimal: true }}>
          <Button
            text={this.playbook ? playbook.name : "(No selection)"}
            rightIcon="double-caret-vertical" />
        </Select>
      </FormGroup>

      <p> End </p>
      </div>
    );
  }
}

const playbookRenderer = (playbook, { handleClick, modifiers }) => {
  console.log(playbook);
  return (
    <MenuItem
      active={modifiers.active}
      disabled={modifiers.disabled}
      key={playbook.id}
      onClick={handleClick}
      text={playbook.name}
    />
  );
};

export default HunterCreator
